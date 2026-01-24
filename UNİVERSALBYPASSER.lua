-- [[ UNIVERSAL JUNKIE KEY SYSTEM BYPASS ]]
-- Bu script ana scriptten ÖNCE çalıştırılmalıdır.

print("--- [ Junkie Bypass Baslatildi ] ---")

-- 1. Junkie objesini hafızada donduralım ve manipüle edelim
local function ApplyBypass(obj)
    if type(obj) == "table" then
        -- Anahtar kontrolünü 'her zaman doğru' yap
        obj.check_key = function()
            print("[Bypass] Junkie: Anahtar Onaylandi!")
            return {valid = true, status = "success", message = "Bypassed"}
        end
        -- Key alma linkini etkisizlestir
        obj.get_key_link = function()
            return "https://google.com", "BYPASS_ACTIVE"
        end
    end
end

-- 2. Global Junkie tablosunu izle (Eğer zaten yüklendiyse)
if getgenv().Junkie then
    ApplyBypass(getgenv().Junkie)
end

-- 3. Kütüphane indirmelerini yakala (Dinamik Bypass)
-- Script HttpGet ile Junkie kütüphanesini indirdiğinde araya girer
local old_loadstring
old_loadstring = hookfunction(loadstring, function(code, ...)
    local res = old_loadstring(code, ...)
    -- Eğer indirilen kod bir Junkie objesi dönüyorsa onu hackle
    if type(res) == "function" then
        return function(...)
            local module = res(...)
            ApplyBypass(module)
            return module
        end
    end
    return res
end)

-- 4. HTTP Isteklerini Kandır (Sunucu cevabını beklemeden 'Success' döndür)
local old_request
old_request = hookfunction(request or http_request or syn.request, function(options)
    if options.Url:find("jnkie.com") then
        print("[Bypass] Sunucu isteği yakalandı ve sahtelendi: " .. options.Url)
        return {
            StatusCode = 200,
            Body = '{"valid":true,"status":"success","message":"Bypassed"}'
        }
    end
    return old_request(options)
end)

print("--- [ BYPASS AKTIF: Simdi asil scriptini calistirabilirsin ] ---")