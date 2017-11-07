package com.thinkgem.jeesite.modules.sys.utils.pingplusplus;

/**
 * Ping++ Base class
 */
public abstract class Pingpp {
    /**
     * Ping++ API BASE URL
     */
    public static final String LIVE_API_BASE = "https://api.pingxx.com";
    /**
     * version
     */
    public static final String VERSION = "2.1.7";
    /**
     * api key
     */
    public static volatile String apiKey;
    /**
     * api version
     */
    public static volatile String apiVersion = "2016-03-24";

    public static String AcceptLanguage = "zh-CN";

    private static volatile boolean verifySSL = true;
    private static volatile String apiBase = LIVE_API_BASE;

    public static volatile String privateKey="MIICXAIBAAKBgQC3IWZfgkM//cnIZ+3NMCrxLzfNf33P+k9Xen+8J6c+LdBwhgWq"+
"vHET9LNVNFToNk/+MA8y94fwM912SINKkRLfXuSGcpJA7ZohdonApDGQHc4YYS6s"+
"+sbtWzeYWZScLvGVSvAAamQ77I1mfFoKm82NAD6ExD1nW9q1F2Xxt6MeWQIDAQAB"+
"AoGAZ34jqcQnF0nouC4r0PLwwb7KjYMIafnuzuQ2vfG27Ufc7UqAd13plbqLgpKB"+
"jX3sNR2Z6VbEZzYYaRlPwVs9SzRLU02fNf8tNYoZzBt4IikL3sZwN+JAJMt358+2"+
"MHICEyGrqGQiqdfPTunHDOMjwam4xlhoQ5UniDTdmCwQWKUCQQDabj5SxBtnHolD"+
"GlejVSPP9m8F2IAVS9ivbFPBxREYuQ2pP+XdEeCt1siEQB3giTk/RKiuYVtPEJic"+
"RW/bJVYfAkEA1qDZQYoJzjUPOTmiIRcNos+/oAj8nOB6xWCe4x+6eWI/7Z4lWZsO"+
"m7hjcdCnIhlrNblEO/fY5Cx6/jUo+27MhwJAXb0j9+b7D5T2ORrr80dNeCj82lhg"+
"F0OWeSoXA7grrx1zdGfcoLPUZSYgpUjSyZJ6Q+GWNkfHpLWtmJrf9v8d5wJBAJTP"+
"8dL/Ys0W/PcwfrlywoGgibzsfjpHathvpbrUxPZkqO6YOE1otThDILBJe5ipByy4"+
"yBbMQhXywVSAh2nN6QECQFGbnZ4KtReO464wFAChQwYNzTKfPbVum8DpaF/JVMlm"+
"myhi6uzwg7uBHF2QsgsLZD13DtNq0/t1bVEtba5FvU0=";
    public static volatile String privateKeyPath;

    public static Boolean DEBUG = false;

    /**
     * (FOR TESTING ONLY)
     * If you'd like your API requests to hit your own (mocked) server,
     * you can set this up here by overriding the base api URL.
     */
    public static void overrideApiBase(final String overriddenApiBase) {
        apiBase = overriddenApiBase;
    }

    /**
     * (FOR TESTING ONLY)
     * Only disable SSL verification if you're using your own (mocked) server.
     * Disabling verification on pingxx.com is not supported
     */
    public static void setVerifySSL(boolean verify) {
        verifySSL = verify;
    }

    /**
     * get SSL state
     *
     * @return true is set SSL ,false is not set SSL
     */
    public static boolean getVerifySSL() {
        return verifySSL;
    }

    /**
     * get api url
     *
     * @return String  api url
     */
    public static String getApiBase() {
        return apiBase;
    }

    /**
     * set api url
     *
     * @param apiBase
     */
    public static void setApiBase(String apiBase) {
        Pingpp.apiBase = apiBase;
    }
}
