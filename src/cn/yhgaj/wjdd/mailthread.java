package cn.yhgaj.wjdd;


import static cn.yhgaj.wjdd.sendmail.sendmsgmail;

public class mailthread implements Runnable {
    private String addr;
    private String title;
    private String content;
    public void setName(String mailaddr,String mailtitle,String mailcontent)
    {
        this.addr = mailaddr;
        this.title = mailtitle;
        this.content = mailcontent;

    }
    public void run()
    {
        try {
            sendmsgmail(addr,title,content);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }
}
