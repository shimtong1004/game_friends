if Rails.env == "production"
    ## 本番の定数
    URL = "http://happyhouse.me:83/"
else
    URL = "http://localhost:3000/"
end