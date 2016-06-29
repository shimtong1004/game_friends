json.array!(@kakao_accounts) do |kakao_account|
  json.extract! kakao_account, :id
  json.url kakao_account_url(kakao_account, format: :json)
end
