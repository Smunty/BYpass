-- [[ JUNKIE LIBRARY BYPASS EDITED ]]
local HttpService = game:GetService("HttpService")

local Junkie = {}
Junkie.service = "Addons"
Junkie.identifier = "1001263"
Junkie.base_url = "https://api.jnkie.com/api/v1/whitelist"
Junkie.script_id = nil
Junkie.provider = "Key"

-- ANAHTAR KONTROLÜNÜ DEVRE DIŞI BIRAKAN FONKSİYON
function Junkie.check_key(key)
    print("[Bypass] Anahtar kontrolü atlandı! Key: " .. tostring(key))
    -- Sunucuya gitmek yerine doğrudan 'doğru' yanıtı dönüyoruz
    return {
        valid = true, 
        status = "success", 
        message = "Bypassed by Gemini Analysis"
    }
end

-- ANAHTAR ALMA LİNKİNİ DEVRE DIŞI BIRAKAN FONKSİYON
function Junkie.get_key_link(provider)
    print("[Bypass] Link isteği engellendi.")
    return "https://google.com", "BYPASS_ACTIVE"
end

-- Kütüphaneyi sisteme tanıt
getgenv().Junkie = Junkie
return Junkie
