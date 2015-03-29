<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.ddiv class="divtd"">
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="/usr/local/openerp/community/pick_pack_ship/report/packslip.css"></link>
        <script src='/usr/local/openerp/community/pick_pack_ship/report/jquery-1.10.2.min.js'></script>
        <script src='/usr/local/openerp/community/pick_pack_ship/report/jquery-barcode.min.js'></script>
        <script src='/usr/local/openerp/community/pick_pack_ship/report/packslip.js'></script>
        <script>
            $(document).ready(function(){
            onebytwo();
            scalefont();
            barcode();
            subst();
            //pagecount();
            controlno();
            highlightme();
            cleandecimals();
            //workingfooter();
            //jqfooter();
            //totebarcode();
            //showheight();
                });
        </script>
    </head>
<body id="packingslip">

    %for wave in objects:
    <% block heada scoped %>
    <br>
    <div class="headtable">
        <div class="divtr">
	    <div class="divtd" style="font-size: 45px;" ></div>
            <div class="divtd head top department" style="width: 20%;">
		<br>
		<div>Info 1</div>
		<div>Info 2</div>
		<div>Info 3</div>
            </div>
            <div class="divtd head top" width: 20%;">
                <div class="onebytwo">${wave.id}</div>
            </div>

            <div class="divtd head top" align="right" style="width: 30%;">
                <div class="divtr">
		    <div class="detailtableheadertop" >
		        <div class="divthhead whiteonblack">
                            <div class="divtd thcell" style="font-size: 15px;">License Plate</div>
                            <div class="divtd thcell" style="font-size: 15px;">Date</div>
			</div>
			<div class="divtr">
                            <div class="divtd detailline" style="font-size: 12px;">${wave.name}</div>
                            <div class="divtd detailline" style="font-size: 12px;">some date</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <% endblock %>
    ${heada}
<% set myorderlines = paginate_items(wave.picks) %>
<% set count = 0 %>
    %for myset in myorderlines:
	<% set count = count + 1 %>

%if count > 1:
    <div style="page-break-after: always;"></div>
    <div class="headtable">
        <div class="divtr">
	    <div class="divtd"></div>
            <div class="divtd head top department" style="width: 20%;">
                <br>
		<div>Info 1</div>
		<div>Info 2</div>
		<div>Info 3</div>
            </div>
            <div class="divtd head top" width: 20%;">
                <div class="onebytwo">${12345678}</div>
            </div>

            <div class="divtd head top" align="right" style="width: 30%;">
                <div class="divtr">
                    <div class="detailtableheadertop" >
                        <div class="divthhead whiteonblack">
                            <div class="divtd thcell" style="font-size: 15px;">License Plate</div>
                            <div class="divtd thcell" style="font-size: 15px;">Date</div>
                        </div>
                        <div class="divtr">
                            <div class="divtd detailline" style="font-size: 12px;">${wave.name}</div>
                            <div class="divtd detailline" style="font-size: 12px;">some date</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
%endif

%if count > 1:
    <br>
    <br>
    <div class="detailtable_extended">
%else:
    <div class="detailtable">
%endif
            <div class="divth whiteonblack">
                <div class="divtd thcell" style="font-size: 14px; width: 30%;">Bin</div>
                <div class="divtd thcell" style="font-size: 14px; width: 13%;">Quantity</div>
	        <div class="divtd thcell" style="font-size: 14px; width: 15%;">Sku</div>
                <div class="divtd thcell" style="font-size: 14px; width: 30%">Description</div>
	        <div class="divtd thcell" style="font-size: 14px; width: 13%;">Container</div>
            </div>

            <!--for order in page:-->
            %for line in myset:
                <div class="divtr">
		    <div class="divtd detailline">${line['location']}</div>
                    <div class="divtd detailline qty highlightme">${line['qty_order']}</div>
		    <div class="divtd detailline"><strong>${line['sku']}</strong></div>
		    <div class="divtd detailline">${line['description']}</div>
		    <div class="divtd detaillinecontainer">${line['container']}</div>
                </div>
            %endfor
	    
        </div>
    </div>
    %endfor
    <br>
    <br>
    <!-- END WRAPPER -->
</div>
    <div class="footer_bottom">
        <div class="detailtableheaderbottom">
            <div class="divth whiteonblack">
                <div class="divtd thcell">This is the last page</div>
	    </div>
	    <div class="divtr">
            </div>
        </div>
        <br>
        <br>
    </div>
<!-- END FOR LOOP THREE -->
    <div class="push"></div>
    <div style="page-break-after: always;"></div>

  %endfor
  <% set printed = mark_printed(objects) %>
</body>
</html>
