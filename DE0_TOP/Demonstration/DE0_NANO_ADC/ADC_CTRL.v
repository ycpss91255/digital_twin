module ADC_CTRL	(	
					iRST,
					iCLK,
					iCLK_n,
					iGO,
					iCH,
					oLED,
					
					oDIN,
					oCS_n,
					oSCLK,
					iDOUT
				);
					
input				iRST;
input				iCLK;
input				iCLK_n;
input				iGO;
input	[2:0]		iCH;
output	[7:0]		oLED;

output				oDIN;
output				oCS_n;
output				oSCLK;
input				iDOUT;

reg					data;
reg					go_en;
wire	[2:0]		ch_sel;
reg					sclk;
reg		[3:0]		cont;
reg		[3:0]		m_cont;
reg		[11:0]		adc_data;
reg		[7:0]		led;

assign	oCS_n		=	~go_en;
assign	oSCLK		=	(go_en)? iCLK:1;
assign	oDIN		=	data;
assign	ch_sel		=	iCH;
assign	oLED		=	led;

always@(posedge iGO or negedge iRST)
begin
	if(!iRST)
		go_en	<=	0;
	else
	begin
		if(iGO)
			go_en	<=	1;
	end
end

always@(posedge iCLK or negedge go_en)
begin
	if(!go_en)
		cont	<=	0;
	else
	begin
		if(iCLK)
			cont	<=	cont + 1;
	end
end

always@(posedge iCLK_n)
begin
	if(iCLK_n)
		m_cont	<=	cont;
end

always@(posedge iCLK_n or negedge go_en)
begin
	if(!go_en)
		data	<=	0;
	else
	begin
		if(iCLK_n)
		begin
			if (cont == 2)
				data	<=	iCH[2];
			else if (cont == 3)
				data	<=	iCH[1];
			else if (cont == 4)
				data	<=	iCH[0];
			else
				data	<=	0;
		end
	end
end

always@(posedge iCLK or negedge go_en)
begin
	if(!go_en)
	begin
		adc_data	<=	0;
		led			<=	8'h00;
	end
	else
	begin
		if(iCLK)
		begin
			if (m_cont == 4)
				adc_data[11]	<=	iDOUT;
			else if (m_cont == 5)
				adc_data[10]	<=	iDOUT;
			else if (m_cont == 6)
				adc_data[9]		<=	iDOUT;
			else if (m_cont == 7)
				adc_data[8]		<=	iDOUT;
			else if (m_cont == 8)
				adc_data[7]		<=	iDOUT;
			else if (m_cont == 9)
				adc_data[6]		<=	iDOUT;
			else if (m_cont == 10)
				adc_data[5]		<=	iDOUT;
			else if (m_cont == 11)
				adc_data[4]		<=	iDOUT;
			else if (m_cont == 12)
				adc_data[3]		<=	iDOUT;
			else if (m_cont == 13)
				adc_data[2]		<=	iDOUT;
			else if (m_cont == 14)
				adc_data[1]		<=	iDOUT;
			else if (m_cont == 15)
				adc_data[0]		<=	iDOUT;
			else if (m_cont == 1)
				led	<=	adc_data[11:4];
		end
	end
end

endmodule