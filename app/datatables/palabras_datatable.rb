# -*- encoding : utf-8 -*-
class PalabrasDatatable
  include Rails.application.routes.url_helpers
  delegate :content_tag, :params, :h, :link_to, :number_to_currency, :url_helpers, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options={})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Palabra.count,
      iTotalDisplayRecords: palabras.total_entries,
      aaData: data
    }
  end

  private
  def data
    palabras.map do |palabra|
      links = content_tag('div', class: 'btn-group') do
        link_to('Editar',edit_palabra_path(palabra), class: 'btn')+
          link_to('Eliminar', palabra, method: :delete, data: { confirm: '¿Estás seguro?' }, class: 'btn')+
          link_to('Variante',new_palabra_variante_path(palabra), class: 'btn') 
      end
      [
        link_to(palabra.palabra, palabra),
        h(palabra.lugar),
        links
      ]
    end
  end

  def palabras
    @palabras ||= fetch_palabras
  end

  def fetch_palabras
    palabras = Palabra.order("#{sort_column} #{sort_direction}")
    palabras = palabras.page(page).per_page(per_page)
    if params[:sSearch].present?
      palabras = palabras.where("palabra like :search", search: "%#{params[:sSearch]}%")
    end
    palabras
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w{ palabra lugar }
    columns[params[:iSortcol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
