Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'startup_wizard_main_menu_tabs',
  insert_bottom: 'nav',
  text: <<~HTML
    <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
    <ul class="nav nav-sidebar border-bottom">
        <li class="sidebar-menu-item d-block w-100 position-relative"><a class="w-100 p-3 d-flex align-items-center icon-link with-tip action-magic.svg" href="/admin/startup_wizard" data-original-title="" title=""><svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="magic" class="svg-inline--fa fa-magic fa-w-16 icon-magic mr-2 icon icon-magic.svg" role="img" viewBox="0 0 512 512" width="16px" height="16px"><path fill="currentColor" d="M224 96l16-32 32-16-32-16-16-32-16 32-32 16 32 16 16 32zM80 160l26.66-53.33L160 80l-53.34-26.67L80 0 53.34 53.33 0 80l53.34 26.67L80 160zm352 128l-26.66 53.33L352 368l53.34 26.67L432 448l26.66-53.33L512 368l-53.34-26.67L432 288zm70.62-193.77L417.77 9.38C411.53 3.12 403.34 0 395.15 0c-8.19 0-16.38 3.12-22.63 9.38L9.38 372.52c-12.5 12.5-12.5 32.76 0 45.25l84.85 84.85c6.25 6.25 14.44 9.37 22.62 9.37 8.19 0 16.38-3.12 22.63-9.37l363.14-363.15c12.5-12.48 12.5-32.75 0-45.24zM359.45 203.46l-50.91-50.91 86.6-86.6 50.91 50.91-86.6 86.6z"></path></svg>
        <span class="text">Startup Wizard</span></a></li>
    </ul>
    <% end %>
  HTML
)
