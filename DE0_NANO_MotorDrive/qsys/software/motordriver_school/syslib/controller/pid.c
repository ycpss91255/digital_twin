#include "controller.h"


void PIDinit(sPIDCtrl_s *sCtrl, unsigned int uiCtrlTimeUnit){
    /* PID digital controller formula:
     *      yo(kT) = KpE(kT) +Ki(sigma{j=0}{t}E(jT))+Kd[E(kT)-E((k-1)T)])
     *
     *
     * */
    sCtrl->fRefCom = 0;
    sCtrl->fErrT = 0;
    sCtrl->fDeltaErr = 0;
    sCtrl->fErrLastTime = 0; /* timer interrupt unit */
    sCtrl->fIntegralErr = 0;
    sCtrl->fDeltaCmd = 0;
    sCtrl->iCtrlOutCmd = 0;

    /* set parameters */
    sCtrl->fKp = PID_Kp;
    sCtrl->fKi = PID_Ki;
    sCtrl->fKd = PID_Kd;
    sCtrl->uiControlTime = uiCtrlTimeUnit;
    sCtrl->uiSpdCntCmd = 0;

    sCtrl->cSpd_posN = PID_Spd_posN; /* choice control method */


}

void PIDctrl(sPIDCtrl_s *sCtrl, float fSensorValue){
    /* PID digital controller formula:
     *      yo(kT) = KpE(kT) +Ki(sigma{j=0}{k}E(jT))+Kd[E(kT)-E((k-1)T)])
    */
    /* calculate error */
    int     iTmpCmd;

//    printf("refcmd=%f\n", sCtrl->fRefCom);

    { /* calculate Error(t), boundary: -1 ~ 1*/
        sCtrl->fErrT = sCtrl->fRefCom - fSensorValue;
        if(sCtrl->fErrT > 1.0) sCtrl->fErrT = 1.0;
        else if (sCtrl->fErrT < -1.0) sCtrl->fErrT = -1.0;
    }
    { /* calculate DeltaErr(t) boundary: -1 ~ 1*/
        sCtrl->fDeltaErr = sCtrl->fErrT - sCtrl->fErrLastTime;
        if(sCtrl->fDeltaErr > 1.0) sCtrl->fDeltaErr = 1.0;
        else if (sCtrl->fDeltaErr < -1.0) sCtrl->fDeltaErr = -1.0;
    }
    { /* calculate Integral error boundary: -1 ~ 1*/
        sCtrl->fIntegralErr = sCtrl->fIntegralErr + sCtrl->fErrT;
        if(sCtrl->fIntegralErr > 1.0) sCtrl->fIntegralErr = 1.0;
        else if (sCtrl->fIntegralErr < -1.0) sCtrl->fIntegralErr = -1.0;
    }

    { /* control method choice */
        if(sCtrl->cSpd_posN){ /* speed control */
            sCtrl->fDeltaCmd = sCtrl->fKp*sCtrl->fErrT +
                        sCtrl->fKi*(sCtrl->fIntegralErr) +
                        sCtrl->fKd*sCtrl->fDeltaErr;
            iTmpCmd = (int) (sCtrl->iCtrlOutCmd + (int) (sCtrl->fDeltaCmd * PID_OutX));
        } else { /* position control */
        	iTmpCmd = (int)(sCtrl->fKp*sCtrl->fErrT +
                             sCtrl->fKi*(sCtrl->fIntegralErr) +
                             sCtrl->fKd*sCtrl->fDeltaErr);
        }
    }
    /* boundary check */
    //LOGD("PID=%d\n",  iTmpCmd);
    {
    	if(sCtrl->fRefCom == 0){ /* 命令為0時，強迫輸出電壓為0*/
    		sCtrl->iCtrlOutCmd = 0;
    	}else {
            if( iTmpCmd >= PwmMaxDuty){ /* */
                sCtrl->iCtrlOutCmd = PwmMaxDuty;
            }else if(iTmpCmd <= PwmMinDuty){
                sCtrl->iCtrlOutCmd = PwmMinDuty;
            }else {
                sCtrl->iCtrlOutCmd = iTmpCmd;
            }
    	}

    }


    /* update variable */
    sCtrl->fErrLastTime = sCtrl->fErrT; /* release Error(t-1)*/
}

