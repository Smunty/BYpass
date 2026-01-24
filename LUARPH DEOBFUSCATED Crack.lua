-- [[ JUNKIE KEY SYSTEM BYPASS ]]
local Junkie = {}
Junkie.service = "Addons"
Junkie.identifier = "1001263"
Junkie.base_url = "https://api.jnkie.com/api/v1/whitelist"

-- Sunucuya gitmek yerine her zaman "Tamam" diyen sahte fonksiyon
function Junkie.check_key(key)
    print("Bypass: Anahtar kontrolü atlanıyor...")
    return {
        valid = true, 
        message = "Bypassed by Smunty XD",
        status = "success"
    }
end

-- Key alma linki fonksiyonunu da etkisiz hale getirelim
function Junkie.get_key_link(provider)
    return "https://google.com", "BYPASS_ACTIVE"
end

-- Scriptin geri kalanının Junkie objesini görmesini sağla
getgenv().Junkie = Junkie
print("--- [ KEY SİSTEMİ DEVRE DIŞI BIRAKILDI ] ---")