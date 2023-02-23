/*
    function description: Accumulate the feedback signal and direction of motor
    Input:
        A and B phase
    Output:
        1. Motor feedback accumulate counter
        2. motor direction
*/
module MotorFBAccumulate (
           iClk50M,             /* 50Mhz */
           iRst_n,              /* reset negitive */
           
           /* clear */
           iMotorFBClr_t,       /* clear motor feedback counter */
           /* motor encoder signal */
           iPhA,                /* phase A */
           iPhB,                /* phase B */
           
           /* export to NIOS */
           
           oMotorFBAccmCnt,     /* current motor feedback accumulate counter, it is signed number. 
                                  [31:0] export Accumulate counter, signed number */
           oMotorFBDir          /* 0: pha > phb, 1: pha < phb */
           

);
//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;     /* 50Mhz */
input           iRst_n;      /* reset negitive */

           /* clear */
input           iMotorFBClr_t;  /* clear motor feedback counter trigger */
           
           /* motor encoder signal */
input           iPhA;        /* phase A */
input           iPhB;        /* phase B */
           
           /* export to NIOS */
           
output signed [31:0]   oMotorFBAccmCnt;  /* current motor feedback counter */
output                 oMotorFBDir;      /* 0: pha > phb, 1: pha < phb */
//=======================================================
//  REG/WIRE declarations
//=======================================================
/* motor signal*/
reg                 oMotorFBDir;
wire                wPhaXorPhb;


reg signed [31:0]   rFBCnt; /* count feedback */
reg                 rTmpPhaXorPhb;
//=======================================================
//  Structural coding
//=======================================================
assign wPhaXorPhb = iPhA ^ iPhB;
assign oMotorFBAccmCnt = rFBCnt;     /* [31:0] export Accumulate counter, signed number */



/*=====================================================*/
/* detect direction */
reg     rTmpPhaA, rTmpPhaB;
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rTmpPhaA <= 0;
        rTmpPhaB <= 0;
        oMotorFBDir <= 0;
    end else begin
        rTmpPhaA <= iPhA;
        rTmpPhaB <= iPhB;
        if({rTmpPhaB, iPhB}==2'b01 ) begin
            if(iPhA) begin
               oMotorFBDir <= 0;/* A > B */
            end else begin
               oMotorFBDir <= 1;/* B > A */
            end
        end else if({rTmpPhaA, iPhA}==2'b01 ) begin
            if(iPhB) begin
               oMotorFBDir <= 1;/* B > A */
            end else begin
               oMotorFBDir <= 0;/* A > B */
            end
        end else if({rTmpPhaB, iPhB}==2'b10 ) begin
            if(iPhA) begin
               oMotorFBDir <= 1;/* B > A */
            end else begin
               oMotorFBDir <= 0;/* A > B */
            end
        end else if({rTmpPhaA, iPhA}==2'b10 ) begin
            if(iPhB) begin
               oMotorFBDir <= 0; /* A > B */
            end else begin
               oMotorFBDir <= 1;/* B > A */
            end
        end else begin
            oMotorFBDir <= oMotorFBDir;
        end
    end
end

/*=====================================================*/
/* count feedback signal */
reg rDlyClr;
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rTmpPhaXorPhb <= 0;
        rDlyClr <= 0;
        rFBCnt <= 0;/* start count at half of 65536 */
    end else begin
        rTmpPhaXorPhb <= wPhaXorPhb;
        rDlyClr <= iMotorFBClr_t;
        if({rDlyClr, iMotorFBClr_t}==2'b01) begin
            rFBCnt <= 0;
        end else if({rTmpPhaXorPhb, wPhaXorPhb}== 2'b01 ) begin
            if(oMotorFBDir) begin
                rFBCnt <= rFBCnt - 1; /* CCW */
            end else begin
                rFBCnt <= rFBCnt + 1; /* CW */
            end
        end else if({rTmpPhaXorPhb, wPhaXorPhb}== 2'b10 ) begin
            if(oMotorFBDir) begin
                rFBCnt <= rFBCnt - 1; /* CCW */
            end else begin
                rFBCnt <= rFBCnt + 1; /* CW */
            end
        end else begin
            rFBCnt <= rFBCnt;
        end
    end
end

endmodule
