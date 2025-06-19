<?php 
/***************************************
level 0 시나리오 답변을 정의한다 
***************************************/

function level1Answer($write, $row){
	/*
	$check_answer
	$replace=array();
	//시나리오 고유번호를 정의
	*/
	$answer=array(); // 결과정의
	$replace=array(); // 대입변경
	if($write['wr_id']==1){
		//시나리오 1번을 
		$replace[]=$row[7];
		$replace[]=$row[8];
		$result= ($row[7] / $row[8] );
		$result= round($result, 1);
		$answer[]=$result;
		$replace[]=$result;
	}
	else if($write['wr_id']==2){
		//시나리오 2번 
		//투여량=  (처방 용량)/(패키지 용량)
		$replace[]=$row[7];
		$ex_8=explode(",",$row[8]);
		$replace[]=$ex_8[0];
		$replace[]=$ex_8[1];

		//패키지 용량 : 성분용량 / 전체 용량	
		$result= ($row[7] / ( $ex_8[0]/$ex_8[1]) );
		$result= round($result, 1);
			
		$answer[]=$result;
		$replace[]=$result;
	}
	else if($write['wr_id']==3){
		//시나리오 3번 
		//총처방용량 = kg당 처방용량 x 체중 (kg)
		//패키지 용량 : 성분용량 / 전체 용량
		$replace[]=$row[8];
		$replace[]=$row['1W'];
		
		$result=$row[8] * $row['1W'];
		$replace[]=$result; 

		//투여량=  (총 처방 용량)/(패키지 용량)
		$ex_9=explode(",",$row[9]);
		$replace[]=$ex_9[0];
		$replace[]=$ex_9[1];
		
		
		$result2= ($result / ( $ex_9[0]/$ex_9[1]) );
		$result2= round($result2, 2);
		$replace[]=$result2;
		$answer[]=$result2;
	}
	else if($write['wr_id']==4){
		//시나리오 4번 
		//총처방용량 = kg당 처방용량 x 체중 (kg)
		$replace[]=$row['8A'];
		$replace[]=$row['1W'];
		$result=($row['8A'] * $row['1W']);
		$replace[]=$result; 

		/*패키지 용량 : 
1:10,000 = 1mg / 10mL
1:1,000 = 1mg / 1mL
		*/
		$result2=$result * 0.001 ;
		$replace[]=$result2;
		$ex_8=explode(",",$row[8]);
		$replace[]=$ex_8[0];
		$replace[]=$ex_8[1];

		//투여량=  (총 처방 용량)/(패키지 용량)
		$result2= ($result2 / ( $ex_8[0]/$ex_8[1]) );
		$result2= round($result2, 1);

		//단위 통일 1 mg = 1,000 mcg
		$replace[]=$result2;
		$answer[]=$result2;
	}
	else if($write['wr_id']==5){
		//시나리오 5번 
		/*패키지 용량 = 1:1,000 = 1mg / 1mL
1:10,000 = 1mg / 10mL
		*/
		$ex_11=explode(",",$row[11]);
		$replace[]=$ex_11[0];
		$replace[]=$ex_11[1];
		$replace[]=$row[10];

		//투여량=  (처방 용량)/(패키지 용량)
		$result= ($row[10] / ( $ex_11[0]/$ex_11[1]) );
		$result= round($result, 1);
		$replace[]=$result;
		$answer[]=$result;
	}
	else if($write['wr_id']==6){
		//패키지 용량 : 
		/*
		0.5% Lidocaine 5 mg / mL
		1% Lidocaine  10 mg/mL
		2% Lidocaine  20 mg/mL
		*/
		$replace[]=$row[6];
		$result=$row[6]*10;
		$replace[]=$result; 
		$answer[]=$result;
		
		//투여량=  (처방 용량)/(패키지 용량)
		$ex_7=explode(",",$row[7]);
		$replace[]=$ex_7[0];
		$replace[]=$ex_7[1];
		$result2= ( ( $ex_7[0]/$ex_7[1]) / $result );
		$replace[]=$result2;
		$answer[]=$result2;
		
		/*
		1분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))
		*/
		$replace[]=EXAM_1HOUR;	
		$replace[]=EXAM_GTT;	
		$result3=($result2 * EXAM_1HOUR * EXAM_GTT) / EXAM_1HOUR;
		$result3= round($result3, 1);

		$replace[]=$result3;
		$answer[]=$result3;

	}
	else if($write['wr_id']==7){
		//시나리오 7 	
		//농도=  (용질의 양)/(용액의 양)
		$ex_7=explode(",",$row[7]);
		$replace[]=$ex_7[0];
		$replace[]=$ex_7[1];
		$result= ( $ex_7[0]/$ex_7[1]) ;
		$replace[]=$result;
		$answer[]=$result;
	}
	else if($write['wr_id']==8){
		//시나리오 8 
		//투여량=  (처방 용량)/(패키지 용량)
		$replace[]=$row[6];
		$ex_7=explode(",",$row[7]);
		$replace[]=$ex_7[0];
		$replace[]=$ex_7[1];
		
		$result= ( $row[6] / ($ex_7[0]/$ex_7[1]) ) ;
		$result= round($result, 1);
		$replace[]=$result;
		$answer[]=$result;
	}
	else if($write['wr_id']==9){
		//시나리오 7 
		//1. 총 처방용량 = kg당 처방용량 x 체중 (kg)
		$replace[]=$row['8'];
		$replace[]=$row['1W'];
		$result=($row['8'] * $row['1W']);
		$replace[]=$result;
		$answer[]=$result;

		//2. 분당 처방약품량 (mg/min) =  (총 처방용량 (mg))/(주입시간 (min))
		$replace[]=$row[9];
		$result2=($result / $row[9] );
		$replace[]=round($result2, 4);

		//3. 분당 주입량 (mL/min) =  (총 수액 주입량 (mL))/(주입시간 (min))
		$replace[]=$row[7];
		$result3=($row[7] / $row[9] );
		$replace[]=$result3;
		$result4= round($result3, 1);
		$replace[]=$result4;
		$answer[]=$result4;

		//4. 1분당 방울 수(gtt/min)=분당 주입량 (ml/min)×20(gtt) 
		$replace[]=EXAM_GTT;
		$result5=($result4 * EXAM_GTT );
		$replace[]=$result5;
		$result6= round($result5, 1);
		$replace[]=$result6;
		$answer[]=$result6;
	}
	else if($write['wr_id']==10){
		//시나리오 7 
		//1. 시간당 주입량 (mL/hr) =  (총 주입량 (mL))/(주입시간 (hr))
		$replace[]=$row[4];
		$replace[]=$row[5];
		$result=$row[4] / $row[5];
		$replace[]=round($result, 4);
		
		//4. 1분당 방울 수(gtt/min)=(시간당 주입량 (mL/hr)×20(gtt))/(60(min.))  
		$replace[]=EXAM_GTT;
		$replace[]=EXAM_1HOUR;
		$result2=($result * EXAM_GTT) / EXAM_1HOUR;
		$replace[]=$result2;
		$result3= round($result2, 1);
		$replace[]=$result3;
		$answer[]=$result3;
	}

	else if($write['wr_id']==11){
		//시나리오 11
		/*
		총 처방 약품 용량 = kg당 처방용량 (mg/kg) * 체중 (kg)
		시간당  주입약품량 (mg/hr) =  (총 처방용량 (mg))/(주입시간 (hr))
		*/
		$replace[]=$row[6];
		$replace[]=$row['1W'];
		$result=($row[6] * $row['1W']);
		$replace[]=$result;
		
		$replace[]=EXAM_1DAY; 
		$result2=($result /EXAM_1DAY);
		$replace[]=round($result2, 4);
		$result3= round($result2, 2);
		$replace[]=$result3;
		$answer[]=$result3;
		
		/*
		시간당 수액 주입량 (ml/hr) =  (총 처방 수액량 (ml))/(주입시간 (hr))
		1분당 방울 수(gtt/min)=(시간당 수액 주입량 (ml/hr)×20(gtt))/(60(min.))
		*/ 
		$ex_7=explode(",",$row[7]);
		$replace[]=$ex_7[0];
		$result4= ( $ex_7[0] / EXAM_1DAY) ;
		$replace[]=round($result4, 4);
		$result5= round($result4, 1);
		$replace[]=$result5;

		$replace[]=EXAM_GTT;
		$replace[]=EXAM_1HOUR;
		
		$result6=($result4 * EXAM_GTT) / EXAM_1HOUR;
		$replace[]=round($result6, 4);
		$result7= round($result6, 1);
		$replace[]=$result7;
		$answer[]=$result7;
	}
	else if($write['wr_id']==12){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[8];
		$replace[]=EXAM_GTT;
		$replace[]=EXAM_1HOUR;
		
		$result=($row[8] * EXAM_GTT) / EXAM_1HOUR;
		$result1= round($result, 1);
		$replace[]=$result1;
		$answer[]=$result1;
	}

	else if($write['wr_id']==13){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[6];
		$replace[]=$row[5];
		$result=($row[6]  / $row[5]);
		$result1= round($result, 1);
		$replace[]=$result1;
		$answer[]=$result1;
	}

	
	else if($write['wr_id']==14){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[5];
		$ex_6=explode(",",$row[6]);
		$replace[]=$ex_6[0];
		$replace[]=$ex_6[1];
		$result=($row[5]  / ( $ex_6[0] / $ex_6[1] ));
		$result1= round($result, 1);
		$replace[]=$result1;
		$answer[]=$result1;
	}
	else if($write['wr_id']==15){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$ex_5=explode(",",$row[5]);
		$replace[]=$ex_5[0];
		$replace[]=$ex_5[1];
		$replace[]=$row[6];
		$replace[]=EXAM_1HOUR;
		
		$result = $ex_5[0] * $ex_5[1];
		$replace[]=$result;
		$result1=$row[6] / EXAM_1HOUR;
		$replace[] = round($result1, 4);
		
		$result2=$result / $result1;
		$replace[]= round($result2, 4); 

		$replace[]=EXAM_GTT; 
		$replace[]=EXAM_1HOUR; 
		
		$result3=($result2 * EXAM_GTT) / EXAM_1HOUR; 
		$result4=round($result3, 4);
		$replace[]=$result4;
		
		$replace[]=EXAM_1MINUTE;
		$result5=EXAM_1MINUTE / $result3;
		$replace[]=round($result5, 4);
		$result6=round($result5, 1);
		$replace[]=$result6;
		$answer[]=$result6;
	}

	else if($write['wr_id']==16){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[8];
		$ex_10=explode(",",$row[10]);
		$replace[]=$ex_10[0];
		$replace[]=$ex_10[1];
		$result=$row[8] / ($ex_10[0] / $ex_10[1]) ;  
		$replace[]=$result;
		$answer[]=$result;

		$replace[]=$row[9];
		$result2=$row[9]/$row[8];
		$replace[]=round($result2, 4);
		
		$replace[]=$row[11];
		$replace[]=EXAM_1HOUR; 
		$result3=$row[11]*EXAM_1HOUR;
		$replace[]=$result3;
		$result4=$result3 / 1000;
		$replace[]=$result4;
		
		$result5=$result2 * $result4;
		$result6=round($result5, 1); 

		$replace[]=$result6;
		$answer[]=$result6;
	}

	else if($write['wr_id']==17){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[5];
		$replace[]=$row['1W'];
		$replace[]=EXAM_1HOUR;
		$replace[]=$row[10];

		$result=($row[5] * $row['1W'] * EXAM_1HOUR) / $row[10]; 
		$replace[]=round($result, 4);
		$replace[]=$row[8];
		$replace[]=$row[10];
		$result2=$result * ($row[8] / $row[10]); 
		$result3=round($result2, 1);
		$replace[]=$result3; 
		$answer[]=$result3;
	}

	else if($write['wr_id']==18){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[7];
		$replace[]=EXAM_1DAY;
		$result=($row[7] / EXAM_1DAY);

		$replace[]=round($result, 4);
		$replace[]=$row['9D'];
		$replace[]=$row['9C'];
		$replace[]=$row['9A']+$row['9B'];
		$replace[]=$row['9A'];
		$replace[]=$row['9B'];

		$result2=$result*$row['9B'];
		$replace[]=round($result2,4);
		
		$result3=round($result2,1);
		
		$replace[]=$result3; 
		$answer[]=$result3;
	}

	else if($write['wr_id']==19){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[9];
		$replace[]=$row[100];
		$result=$row[9] / ($row[100] * 1000); 
		$replace[]=round($result, 3);
		
		$replace[]=$row[13];
		$replace[]=$row[11];
		$replace[]=$row[12];
		$replace[]=$row[10];

		$result2= intval((($row[13]*60)-$row[11]) / $row[11]); 
		$replace[]=$result2;
		$result3=($result2 * $row[12]) + $row[10]; 
		$replace[]=$result3;
		$result4 = $result * $result3;
		$result5=round($result4);
		$replace[]=$result5;
		$answer[]=$result5;

		$result6=((20 - $row[10]) / $row[12]) * $row[11]  ;
		

		$replace[]=EXAM_1DAY;
		$result=($row[7] / EXAM_1DAY);

		$replace[]=round($result, 4);
		$replace[]=$row['9D'];
		$replace[]=$row['9C'];
		$replace[]=$row['9A']+$row['9B'];
		$replace[]=$row['9A'];
		$replace[]=$row['9B'];

		$result2=$result*$row['9B'];
		$replace[]=round($result2,4);
		
		$result3=round($result2,1);
		
		$replace[]=$result3; 
		$answer[]=$result3;
	}
	else if($write['wr_id']==20){
		//시나리오 12
		/*
		분당 방울 수(gtt/min)=(시간당 주입량 (ml/hr)×20(gtt))/(60(min.))  
		*/
		$replace[]=$row[6];
		$replace[]=$row[7];
		$replace[]=$row[8];
		$replace[]=$row[9];

		$result=$row[6]/100;
		$replace[]=$result;
		$result2=($row[7] / 100) * $row[8];
		$replace[]=$result2;
		$result3=$row[9] / 100;
		$replace[]=$result3;
		$result4 = $result * $row[8];
		$replace[]=$result4;
		$result5= ($result4 - $result2) / ($result3 - $result) ; 
		$result6 = round($result5);
		
		$replace[]=$result6; 
		$answer[]=$result6;
	}
	return array($answer, $replace);
}
?>