module ApplicationHelper
    def datatime_br(datatime)
        datatime.strftime("%d/%m/%Y %H:%M")
    end

    def active_link(path)
        'active' if current_page?(path)
    end
end
