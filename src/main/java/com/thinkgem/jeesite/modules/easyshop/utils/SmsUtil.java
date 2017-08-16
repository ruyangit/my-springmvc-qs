package com.thinkgem.jeesite.modules.easyshop.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

public class SmsUtil extends Thread {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private int type;
	private String sn;
	
	public SmsUtil(int type, String sn) {
		super();
		this.type = type;
		this.sn = sn;
	}

	public void run(){
		String mobile = DictUtils.getDictValue("sms_config_mobile", "sms_config", "");
		String comid = DictUtils.getDictValue("sms_config_comid", "sms_config", "");
		String username = DictUtils.getDictValue("sms_config_username", "sms_config", "");
		String password = DictUtils.getDictValue("sms_config_password", "sms_config", "");
		String sms_config_content_1 = DictUtils.getDictValue("sms_config_content_1", "sms_config", "");
		String sms_config_content_2 = DictUtils.getDictValue("sms_config_content_2", "sms_config", "");
		String content = "";
		if(type == 1){
			content = sms_config_content_1;
		}else if(type == 2){
			content = sms_config_content_2;
		}
		try {
			log.info("mobile："+mobile);
			content = content.replaceAll("%C%", sn);
			log.info("content："+content);
			content = java.net.URLEncoder.encode(content,"gbk");
			
			String serverUrl="http://jiekou.56dxw.com/sms/HttpInterface.aspx";
			log.info("serverUrl："+serverUrl);
			String data = "comid="+comid+"&username="+username+"&userpwd="+password+"&handtel="+mobile+"&sendcontent="+content+"&sendtime=&smsnumber=10690";
			log.info("data："+data);
			boolean ret = post(serverUrl, data, 6000);
			log.info("send result："+ret);
		} catch (Exception e) {
			log.error("error", e);
		}
		
	}
	
	public boolean post(String serverUrl, String data, long timeout) {
        StringBuilder responseBuilder = null;
        BufferedReader reader = null;
        OutputStreamWriter wr = null;

        URL url;
        try {
            url = new URL(serverUrl);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            conn.setConnectTimeout(1000 * 5);
            wr = new OutputStreamWriter(conn.getOutputStream());

            wr.write(data);
            wr.flush();

//            if (log.isDebugEnabled()) {
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            responseBuilder = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                responseBuilder.append(line).append("\n");
            }
            log.debug(responseBuilder.toString());
//            }
        } catch (IOException e) {
        	log.error("io error", e);
            
        } finally {

            if (wr != null) {
                try {
                    wr.close();
                } catch (IOException e) {
                	log.error("close error", e);
                }
            }

            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                	log.error("close error", e);
                }
            }

        }

        return false;
    }
	
	
	public static int invokeHttpTest() throws Exception
	{
		String content = "【橙子科技】你的验证码：098765";
		content = java.net.URLEncoder.encode(content,"gbk");
	URL url = new URL(
	"http://jiekou.56dxw.com/sms/HttpInterface.aspx?comid=1915&username=shmaker"
	+ "&userpwd=aa123456&handtel=15821554550&sendcontent="+content
	+ "&sendtime=&smsnumber=10690");
	HttpURLConnection httpCon = (HttpURLConnection) url.openConnection();
	httpCon.connect();
	BufferedReader in = new BufferedReader(new InputStreamReader(httpCon.getInputStream()));
	String line = in.readLine();
	System.out.println(" </p>     result:   " + line);
	int i_ret = httpCon.getResponseCode();
	String sRet = httpCon.getResponseMessage();
	System.out.println("sRet   is:   " + sRet);
	System.out.println("i_ret   is:   " + i_ret);
	return 0;
	}
	public static void main(String[] args) {
		try {
			System.out.println(SmsUtil.invokeHttpTest());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
