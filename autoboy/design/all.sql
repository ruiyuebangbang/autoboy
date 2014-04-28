--
-- Create Schema Script 
--   Database Version   : 11.2.0.1.0 
--   Toad Version       : 10.5.0.41 
--   DB Connect String  : ORCL 
--   Schema             : YANGCHEKE 
--   Script Created by  : YANGCHEKE 
--   Script Created at  : 2014-4-21 21:58:12 
--   Physical Location  :  
--   Notes              :  
--

-- Object Counts: 
--   Directories: 0 
--   Functions: 5       Lines of Code: 210 
--   Procedures: 2      Lines of Code: 73 
--   Sequences: 6 


--
-- S_MEMBER  (Sequence) 
--
CREATE SEQUENCE YANGCHEKE.S_MEMBER
  START WITH 180
  MAXVALUE 9999999999999999999999
  MINVALUE 100
  NOCYCLE
  CACHE 10
  NOORDER;


--
-- S_PRODUCT_VEHICLE  (Sequence) 
--
CREATE SEQUENCE YANGCHEKE.S_PRODUCT_VEHICLE
  START WITH 703
  MAXVALUE 999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 10
  NOORDER;


--
-- S_PROVIDER  (Sequence) 
--
CREATE SEQUENCE YANGCHEKE.S_PROVIDER
  START WITH 170
  MAXVALUE 9999999999999999999999
  MINVALUE 100
  NOCYCLE
  CACHE 10
  NOORDER;


--
-- S_PROVIDER_BRAND  (Sequence) 
--
CREATE SEQUENCE YANGCHEKE.S_PROVIDER_BRAND
  START WITH 4
  MAXVALUE 9999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- S_PROVIDER_PRODUCT  (Sequence) 
--
CREATE SEQUENCE YANGCHEKE.S_PROVIDER_PRODUCT
  START WITH 31
  MAXVALUE 99999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 10
  NOORDER;


--
-- S_PROVIDER_SERVICE  (Sequence) 
--
CREATE SEQUENCE YANGCHEKE.S_PROVIDER_SERVICE
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- P_UPDATE_PROVIDER_IMAGE  (Procedure) 
--
CREATE OR REPLACE PROCEDURE YANGCHEKE.p_update_provider_image (vid in integer , vimage in varchar2 ) IS

/******************************************************************************
   NAME:       p_update_provider_image
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2014-3-29   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     p_update_provider_image
      Sysdate:         2014-3-29
      Date and Time:   2014-3-29, 19:47:49, and 2014-3-29 19:47:49
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
row_provider provider%rowtype;
BEGIN
    select * into row_provider from provider where id = vid;
    
    if row_provider.img1 is null then
        update provider set img1 = vimage where id = vid;
    elsif  row_provider.img2 is null   then
         update provider set img2 = vimage where id = vid;
    elsif  row_provider.img3 is null   then
         update provider set img3 = vimage where id = vid;
     elsif  row_provider.img4 is null   then
         update provider set img4 = vimage where id = vid;
    elsif  row_provider.img5 is null   then
         update provider set img5 = vimage where id = vid;
    elsif  row_provider.img6 is null   then
         update provider set img6 = vimage where id = vid;                    
    elsif  row_provider.img7 is null   then
         update provider set img7 = vimage where id = vid;
    elsif  row_provider.img8 is null   then
         update provider set img8 = vimage where id = vid;
    elsif  row_provider.img9 is null   then
         update provider set img9 = vimage where id = vid;                    
    elsif  row_provider.img10 is null   then
         update provider set img10 = vimage where id = vid; 
    else
        null;              
    end if;      
            
   EXCEPTION
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END p_update_provider_image;
/


--
-- P_DEBUG  (Procedure) 
--
CREATE OR REPLACE PROCEDURE YANGCHEKE.p_debug
----监控日志记录
(
    vsource in varchar2,
    vinfo   in varchar2
) 
As
PRAGMA AUTONOMOUS_TRANSACTION;

Begin

    insert into debug_info(source,info)
    values(vsource,vinfo);
    commit;

Exception
    When Others Then
        Dbms_Output.Put_Line('记录日志出错！');
End;
/


--
-- F_INSERTPROVIDERPRODUCT  (Function) 
--
CREATE OR REPLACE FUNCTION YANGCHEKE.f_insertProviderProduct(
                                                             vprovider in Integer,              --供应商
                                                             vproduct in varchar2,             --产品
                                                             vdiscountPrice in varchar2,     --折扣价
                                                             vlabourPrice in varchar2         --人工费
)RETURN NUMBER IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       f_insertProviderProduct
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2014-4-1          1. Created this function.

   NOTES:
******************************************************************************/
cp product%rowtype;
vbrand VEHICLE_BRAND.code%type;
vcount pls_integer;
BEGIN
    p_debug('f_insertProviderProduct','参数:[vprovider]'||vprovider||'[vproduct]'||vproduct||'[vdiscountPrice]'||vdiscountPrice||'[vlabourPrice]'||vlabourPrice);
    select * into cp
    from product where id = to_number(vproduct);
    
    --插入服务商产品表
    select count(*) into vcount from provider_product where provider_id=vprovider and product_id=vproduct;
    if vcount >0 then 
        update provider_product set discount_price=vdiscountPrice, labour_price = vlabourPrice where provider_id=vprovider and product_id=vproduct
        returning id into tmpVar;
    else 
    
        insert into provider_product(  ID,PROVIDER_ID,SERVICE_ID,BRAND_ID,SPECIFICATION,
                                        STANDARD_PRICE ,DISCOUNT_PRICE,LABOUR_PRICE,PRODUCT_ID)
        values( S_PROVIDER_PRODUCT.nextval,vprovider,cp.SERVICE_ID,cp.BRAND_ID,cp.SPECIFICATION,
                cp.STANDARD_PRICE ,to_number(vdiscountPrice),to_number(vlabourPrice),vproduct)
        returning id into tmpVar;

        --插入服务商对应品牌表
        select brand_code into vbrand
        from PRODUCT_VEHICLE t1 join VEHICLE t2 on t1.VEHICLE_ID = t2.id
        where PRODUCT_ID = vproduct and rownum=1;
        
        select count(*) into vcount
        from provider_brand where provider_id=vprovider and brand_code=vbrand;
        if vcount = 0 then
            insert into PROVIDER_BRAND (id,PROVIDER_ID,brand_code)
            values(S_PROVIDER_BRAND.nextval,vprovider,vbrand);
        end if;
    end if;
    return tmpVar;
   EXCEPTION

     WHEN OTHERS THEN

       RAISE;
END f_insertProviderProduct;
/


--
-- F_INSERTPROVIDER  (Function) 
--
CREATE OR REPLACE FUNCTION YANGCHEKE.f_insertProvider(
    vcompname in varchar2, --公司名称
    vagent in varchar2,        --负责人
    vmobile in varchar2,        --负责人电话
    vpassword in varchar2,   --用户密码
    vregion     in number      --公司区域 
)RETURN number IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       f_insertProvider
   PURPOSE:    供应商注册

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2014-4-12          1. Created this function.

   NOTES:

******************************************************************************/
vparm varchar2(4000);
vcount pls_integer;
vprovid integer;
BEGIN
    select count(*) into vcount from member where  MOBIEPHONE = vmobile;
    if vcount >0 then
        return -1001;
    end if;
    select count(*) into vcount from provider where  SHORT_NAME = vcompname;
    if vcount >0 then
        return -1002;
    end if;
    select count(*) into vcount from provider where  agent = vagent;
    if vcount >0 then
        return -1003;
    end if;
    
    insert into provider(ID,REGION_ID,SHORT_NAME,FULL_NAME,AGENT,TELEPHONE,apply_date,apply_type,status)
    values(s_provider.nextval,vregion,vcompname,vcompname,vagent,vmobile,sysdate,0,0) returning id into vprovid;
    
    insert into member(ID,MOBIEPHONE,NICKNAME,PASSWORD,CLASSIFICATION,PROVIDER_ID,IS_ADMIN,IS_DISABLED)
    values(s_member.nextval,vmobile,vagent,vpassword,2,vprovid,1,0);
    
    
    return tmpVar;
   EXCEPTION

     WHEN OTHERS THEN

       RAISE;
END f_insertProvider;
/


--
-- F_GETREGIONNAME  (Function) 
--
CREATE OR REPLACE FUNCTION YANGCHEKE.f_getRegionName (vid in Integer )RETURN varchar2 IS
/******************************************************************************
   NAME:       f_getRegionName
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2014-4-12          1. Created this function.
******************************************************************************/
vret varchar2(1000);
vpid pls_integer;
vname region.name%type;
BEGIN

    select parent_id,name into vpid,vname
    from region 
    where id=vid;
    vret := vname;
    if vpid is not null then
        select parent_id,name into vpid,vname
        from region 
        where id=vpid;
        vret :=  vname||vret;
    end if;
    if vpid is not null then
        select parent_id,name into vpid,vname
        from region 
        where id=vpid;
        vret :=  vname||vret;
    end if;    
    
    return vret;
   EXCEPTION
     WHEN OTHERS THEN
       RAISE;
END f_getRegionName;
/


--
-- F_GETPROVIDERPRODUCTMINPRICE  (Function) 
--
CREATE OR REPLACE FUNCTION YANGCHEKE.f_getProviderProductMinPrice (vproduct in Integer )RETURN NUMBER IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       f_getProviderProductMaxPrice
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2014-4-1          1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     f_getProviderProductMinPrice
      Sysdate:         2014-4-1
      Date and Time:   2014-4-1, 14:28:19, and 2014-4-1 14:28:19
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    select min(discount_price+labour_price) into tmpVar
    from provider_product t where t.PRODUCT_ID = vproduct;
    
    return tmpVar;
   EXCEPTION

     WHEN OTHERS THEN

       RAISE;
END f_getProviderProductMinPrice;
/


--
-- F_GETPROVIDERPRODUCTMAXPRICE  (Function) 
--
CREATE OR REPLACE FUNCTION YANGCHEKE.f_getProviderProductMaxPrice (vproduct in Integer )RETURN NUMBER IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       f_getProviderProductMaxPrice
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2014-4-1          1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     f_getProviderProductMaxPrice
      Sysdate:         2014-4-1
      Date and Time:   2014-4-1, 14:28:19, and 2014-4-1 14:28:19
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    select max(discount_price+labour_price) into tmpVar
    from provider_product t where t.PRODUCT_ID = vproduct;
    
    return tmpVar;
   EXCEPTION

     WHEN OTHERS THEN

       RAISE;
END f_getProviderProductMaxPrice;
/