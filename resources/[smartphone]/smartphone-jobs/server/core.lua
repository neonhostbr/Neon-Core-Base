Tunnel = module('lib/Tunnel')
Proxy = module('lib/Proxy')
vRP = Proxy.getInterface('vRP')
config = json.decode(LoadResourceFile(GetCurrentResourceName(), 'config.json'))
assert(config, 'Config com problemas de formatação')
emitNet = TriggerClientEvent
emit = TriggerEvent
local exposed = {}


Tunnel.bindInterface('smartphone-plugins', exposed)


function throw(message)
  error({ __error = message })
end


function assert(test, message)
  if not test then
    throw(message)
  end
  return test
end


function expose(name, cb)
  exposed[name] = function(...)
    local ok, res = pcall(cb, source, ...)
    if not ok and type(res) == 'string' then
      print('Erro na execução do método '..name..': '..res)
    end
    return res
  end
end


function pusher(source, name, ...)
  assert(name, 'Nome do evento inválido')
  emitNet('smartphone-jobs:pusher', source, name, ...)
end

function notify(source, app, title, subtitle)
  emitNet('smartphone:pusher', source, 'CUSTOM_NOTIFY', {
    app = app, title = title, subtitle = subtitle
  })
end

function table.findBy(t, key, value)
  for _, o in pairs(t) do
    if o[key] == value then
      return o
    end
  end
end

function table.filter(t, callback)
  local res = {}
  for key, val in pairs(t) do
    if callback(val, key) then
      table.insert(res, val)
    end
  end
  return res
end

function table.map(t, callback)
  local o = {}
  for k, v in pairs(t) do
    o[k] = callback(v, k)
  end
  return o
end

function table.reduce(t, cb, initial)
  for k, v in pairs(t) do
    initial = cb(initial, v, k)
  end
  return initial
end

function table.clone(o)
  if type(o) == "table" then
    local r = {}
    for k, v in pairs(o) do
      r[k] = table.clone(v)
    end
    return r
  end
  return o
end


function generateId(isTaken)
  local str = ''
  for i = 1, 10 do
    if math.random() <= 0.5 then
      str = str .. string.char(math.random(65, 90))
    else
      str = str .. string.char(math.random(48, 57))
    end
  end
  if isTaken and isTaken(str) then
    return generateId(isTaken)
  end
  return str
end


function toInt(n)
  return math.floor(tonumber(n))
end

function isPedAlive(ped)
  return GetEntityHealth(ped) > 101
end


