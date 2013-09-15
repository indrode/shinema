class EncryptionService
  class <<self
    def decrypt(token)
      Digest::MD5.hexdigest("#{token}#{ENV["SHINEMA_USER_SECRET"]}")
    end
  end
end