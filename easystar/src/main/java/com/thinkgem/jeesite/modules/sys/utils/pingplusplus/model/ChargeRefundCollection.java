package com.thinkgem.jeesite.modules.sys.utils.pingplusplus.model;

import com.thinkgem.jeesite.modules.sys.utils.pingplusplus.Pingpp;
import com.thinkgem.jeesite.modules.sys.utils.pingplusplus.exception.APIConnectionException;
import com.thinkgem.jeesite.modules.sys.utils.pingplusplus.exception.APIException;
import com.thinkgem.jeesite.modules.sys.utils.pingplusplus.exception.AuthenticationException;
import com.thinkgem.jeesite.modules.sys.utils.pingplusplus.exception.ChannelException;
import com.thinkgem.jeesite.modules.sys.utils.pingplusplus.exception.InvalidRequestException;

import java.util.Map;

public class ChargeRefundCollection extends PingppCollectionAPIResource<Refund> {

    public ChargeRefundCollection all(Map<String, Object> params)
            throws AuthenticationException, InvalidRequestException,
            APIConnectionException, APIException, ChannelException {

        String url = String.format("%s%s", Pingpp.getApiBase(), this.getURL());
        return request(RequestMethod.GET, url, params, ChargeRefundCollection.class);
    }

    public Refund retrieve(String id)
            throws AuthenticationException, InvalidRequestException,
            APIConnectionException, APIException, ChannelException {

        String url = String.format("%s%s/%s", Pingpp.getApiBase(), this.getURL(), id);
        return request(RequestMethod.GET, url, null, Refund.class);
    }

    public Refund create(Map<String, Object> params)
            throws AuthenticationException, InvalidRequestException,
            APIConnectionException, APIException, ChannelException {

        String url = String.format("%s%s", Pingpp.getApiBase(), this.getURL());
        return request(RequestMethod.POST, url, params, Refund.class);
    }

}
