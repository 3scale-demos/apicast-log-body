local _M = require('apicast.policy').new('log_body', '1.0.0')
local new = _M.new



local function isempty(s)
  return s == nil or s == ''
end



function _M:content(context)
  local data= ngx.req.get_body_data()
  ngx.log(ngx.NOTICE, ">> Request Body = ", data)
  
end
function _M:body_filter()
  -- can read and change response body
  -- https://github.com/openresty/lua-nginx-module/blob/master/README.markdown#body_filter_by_lua
  ngx.log(ngx.INFO, "body filter has been started")
  local resp_body = string.sub(ngx.arg[1], 1, 1000)
       -- ngx.ctx.buffered = (ngx.ctx.buffered or "") .. resp_body
        --if ngx.arg[2] then
         -- ngx.var.resp_body = ngx.ctx.buffered
       -- end
  ngx.log(ngx.NOTICE, ">> Response Body (partial) = ", resp_body)
  -- ngx.log(ngx.NOTICE, "ngx.arg[1]= ", ngx.arg[1])
  
  --ngx.log(ngx.ERR, "ngx.ctx.buffered= ", ngx.ctx.buffered)
end
function _M:access(context)

end  
return _M
