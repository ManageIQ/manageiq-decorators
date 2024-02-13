class ServiceTemplateDecorator < MiqDecorator
  def self.fonticon
    'fa fa-cube'
  end

  def fonticon
    atomic? ? super : 'fa fa-cubes'
  end

  def fileicon
    try(:picture) ? "/pictures/#{picture.basename}" : nil
  end

  def quadicon
    fileicon ? {:fileicon => fileicon} : {:fonticon => fonticon}
  end

  def gtl_button_cell
    v = template_valid?
    {
      :is_button => true,
      :text      => _("Order"),
      :title     => t = v ? _("Order this Service") : _("This Service cannot be ordered"),
      :alt       => t,
      :disabled  => !v,
      :onclick   => {:remote => true, :url => "/catalog/x_button/#{id}?pressed=svc_catalog_provision"}
    }
  end
end
