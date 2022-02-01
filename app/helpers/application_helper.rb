module ApplicationHelper
    def datatime_br(datatime)
        datatime.strftime("%d/%m/%Y %H:%M")
    end
end
