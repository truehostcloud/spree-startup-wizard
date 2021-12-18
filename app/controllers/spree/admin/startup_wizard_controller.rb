module Spree
  module Admin
    class StartupWizardController < Spree::Admin::BaseController
      def index
        @checklist = StartupWizardChecklist.order(order: :asc)
        @store = Spree::Store.current
        @statuses = StartupWizardStatus.where(store_id: @store.id)
        @progress = progress
      end

      def toggle
        @store = Spree::Store.current
        @errors = []

        ActiveRecord::Base.transaction do
          permitted_resource_params.each do |checklist_id, status|
            begin
              @status = StartupWizardStatus.find_by(checklist_id: checklist_id, store_id: @store.id)
              raise ActiveRecord::RecordNotFound if @status.nil?
            rescue ActiveRecord::RecordNotFound
              @status = StartupWizardStatus.new(checklist_id: checklist_id, store_id: @store.id, done: false)
              @errors << @status.errors unless @status.save
            end
            @errors << @status.errors unless @status.update(done: status)
          end

          raise ActiveRecord::Rollback unless @errors.empty?
        end

        if @errors.empty?
          respond_with do |format|
            format.html do
              flash[:success] = 'Successfully marked as complete'
              redirect_to '/admin/startup_wizard'
            end
            format.js { render layout: false, status: :created }
          end
        else
          respond_with do |format|
            format.html do
              flash[:error] = 'Could NOT mark as complete'
              redirect_to '/admin/startup_wizard', status: :unprocessable_entity
            end
            format.js { render layout: false, status: :unprocessable_entity }
          end
        end
      end

      private

      def permitted_resource_params
        params.require(:checklist).permit!
      end

      def progress
        total = StartupWizardChecklist.all.count
        done = StartupWizardStatus.where(store_id: @store.id, done: true).count
        (done / total) * 100
      end
    end
  end
end
