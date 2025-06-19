<?php
// 이 파일은 새로운 파일 생성시 반드시 포함되어야 함
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

/*###########################*/
//공고조회 
function alio_notice_search()
{
	//$type : 0 게시공지 가지고오기 , $type : 1 공지 상태 확인
	$return=array();
	for($type=0;$type<2;$type++)
	{
		$insert_cnt = $update_cnt=0; //등록수 , 수정수
		$url = 'http://apis.data.go.kr/B552555/lhLeaseNoticeInfo/lhLeaseNoticeInfo'; /*URL*/	
		//==================================
		//전체 검사
		if($type==1)
		{
			//현재 최소 계시일을 정의하고 마감일 이전을 정의합니다.
			$sql = "select min(PAN_NT_ST_DT) as pdate 
			from lh_notice 
			where lh_use = '1' 
			AND PAN_SS <> '접수마감' ";
			$row=sql_fetch($sql); 
			if($row['pdate']){
				$start_date=str_replace(".","",$row['pdate']);
			}else{
				$start_date=G5_TIME_YMD;
			}
			
			$start_date2=date("Ymd", strtotime("-1 days")); //일주일전 마감 검색 전체마감시
			$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'PG_SZ'=>ALIO_PAGESIZE, 'PAGE'=>"1" , 'PAN_ST_DT'=>$start_date , 'CLSG_ST_DT'=>$start_date2 );
			//END 전체 검사		
		}
		else{
			//전체검사
			/*
			$start_date=date("Ymd", strtotime("-60 months")); //게시일
			$start_date2=date("Ymd", strtotime("-1 days")); //일주일전 마감 검색 전체마감시
			$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'PG_SZ'=>ALIO_PAGESIZE, 'PAGE'=>"1" , 'PAN_ST_DT'=>$start_date , 'CLSG_ST_DT' => $start_date2);
			*/
			//최신검사			
			$start_date=date("Ymd", strtotime("-2 days")); //게시일
			$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'PG_SZ'=>ALIO_PAGESIZE, 'PAGE'=>"1" , 'PAN_ST_DT'=>$start_date );
			
		}
		//==================================
		$result=curlContents($url, "GET", $datas, false); 

		//결과 확인
		if($result==""){
			$return[$type]=array(0);
		}
		if($result[1]['resHeader'][0]['SS_CODE']!="Y"){
			$return[$type]=array(0);
		}

		//내용을 등록
		$list=$result[1]['dsList'];
		$total_cnt= $result[1]['dsList'][0]['ALL_CNT']; //총수량
		for($i=0; $i<$total_cnt; $i+=ALIO_PAGESIZE)
		{
			if($i){
				//============================
				//내용 등록
				$page=intval($i / ALIO_PAGESIZE) + 1 ;
				//전체 검사 
				if($type==1)
				{
					$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'PG_SZ'=>ALIO_PAGESIZE, 'PAGE'=>$page , 'PAN_ST_DT'=>$start_date , 'CLSG_ST_DT'=>$start_date2 );
					//END 전체 검사		
				}
				else{
					//전체검사
					$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'PG_SZ'=>ALIO_PAGESIZE, 'PAGE'=>$page , 'PAN_ST_DT'=>$start_date );
					
					/*
					//최신검사
					$start_date=date("Ymd", strtotime("-1 days")); //게시일
					$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'PG_SZ'=>ALIO_PAGESIZE, 'PAGE'=>$page  , 'PAN_ST_DT'=>$start_date );
					*/
				}
				$result=curlContents($url, "GET", $datas, false); 
			
				if($result==""){
					continue;
				}
				if($result[1]['resHeader'][0]['SS_CODE']!="Y"){
					continue;
				}
				//============================
			}

			$list=$result[1]['dsList'];
			$counter=count($list);

			for($k=0;$k<$counter ;$k++){
				$data=$list[$k];
				
				$data['PAN_NM']=str_replace("'","",$data['PAN_NM']);
				//============================
				//등록값을 확인한다
				$sql_com=" UPP_AIS_TP_NM = '".$data['UPP_AIS_TP_NM']."' , 
				AIS_TP_CD_NM='".$data['AIS_TP_CD_NM']."', 
				PAN_NM='".$data['PAN_NM']."', 
				CNP_CD_NM='".$data['CNP_CD_NM']."', 
				PAN_NT_ST_DT='".$data['PAN_NT_ST_DT']."', 
				CLSG_DT='".$data['CLSG_DT']."', 
				PAN_SS='".$data['PAN_SS']."', 
				DTL_URL='".$data['DTL_URL']."', 
				SPL_INF_TP_CD='".$data['SPL_INF_TP_CD']."', 
				CCR_CNNT_SYS_DS_CD='".$data['CCR_CNNT_SYS_DS_CD']."', 
				PAN_ID='".$data['PAN_ID']."', 
				UPP_AIS_TP_CD='".$data['UPP_AIS_TP_CD']."', 
				AIS_TP_CD='".$data['AIS_TP_CD']."', 
				lh_modidate='".G5_TIME_YMDHIS."' ";

				$sql = "select * from lh_notice where PAN_ID='".$data['PAN_ID']."'";
				$row=sql_fetch($sql); 

				if($row['lh_id']){
					if($row['PAN_SS']!=$data['PAN_SS']){
						//내용 변경
						$sql = "update lh_notice set
						lh_setting='0' ,					
						{$sql_com} 
						where lh_id='{$row['lh_id']}'";
						sql_query($sql);
						$update_cnt++;
					}
				}else{
					//내용을 등록한다
					$sql = "insert into lh_notice set
					lh_id='', 
					lh_use='1' , 
					lh_setting='0' ,	
					lh_inputdate='".G5_TIME_YMDHIS."' , 
					{$sql_com} ";
					sql_query($sql);
					$insert_cnt++;
				}
			}
		}	
		
		$return[$type]=array(0=>1, "total_cnt"=>$total_cnt , "insert_cnt"=>$insert_cnt , "update_cnt"=>$update_cnt , "rnum"=>$data['RNUM'], "start_date"=>$start_date, "start_date2"=>$start_date2 ); 
		
	}
	$sql = "update lh_config set 
	lh_date='".G5_TIME_YMD."'";
	sql_query($sql); 
	return $return;
}


//==================================
//렌탈 search
function alio_rent_search()
{
	$return=array();
	$insert_cnt = $update_cnt=0; //등록수 , 수정수
	$url = 'http://apis.data.go.kr/B552555/lhLeaseNoticeSplInfo/getLeaseNoticeSplInfo'; /*URL*/
	$index=0;

	$sql= "select * from lh_notice 
	where lh_setting='0' 
	AND lh_setting_error='0'
	order by CLSG_DT desc ";
	$result=sql_query($sql); 
	
	while($row=sql_fetch_array($result))
	{
		/*		
		SPL_INF_TP_CD	공급정보구분코드(소분류)
		CCR_CNNT_SYS_DS_CD	고객센터연계시스템구분코드
		PAN_ID	공고아이디
		(공고에 대한 자료 넣기, 임대물건이)
		UPP_AIS_TP_CD	상위매물유형코드
		필터
		*/
		/*
		if( $row['SPL_INF_TP_CD']=="137" )
		{
			$index++;
			if($index<20){
				continue;
			}
			else if($index>23){
				exit();
			}
		}else{
			continue; 
		}
		*/		
		$datas=array('ServiceKey'=>ALIO_SERVICEKEY, 'SPL_INF_TP_CD'=>$row['SPL_INF_TP_CD'], 'CCR_CNNT_SYS_DS_CD'=>$row['CCR_CNNT_SYS_DS_CD'], 'PAN_ID'=>$row['PAN_ID'], 'UPP_AIS_TP_CD'=> $row['UPP_AIS_TP_CD'] );
		
		//END 전체 검사		
		$response=curlContents($url, "GET", $datas, false); 
		//print_r($response);
		//echo "<br><br>";
		$resp = $response[1];
		if(!$resp || !isset($resp['resHeader']) || $resp['resHeader'][0]['SS_CODE']!="Y"){
			$sql="update lh_notice set
			lh_setting_error='1'
			where lh_id='{$row['lh_id']}'";
			sql_query($sql); 
			continue;
		}
		echo $row['lh_id'];
		echo "<br>";
		//등록된 내용을 삭제 ==> 새로운 내용을 등록
		$sql ="delete from lh_rent where lh_id='{$row['lh_id']}' ";
		sql_query($sql); 
		
		$insert_index=0;
		if($row['SPL_INF_TP_CD']=="050" || $row['SPL_INF_TP_CD']=="060" )
		{
			//분양주택(SPL_INF_TP_CD=050), 공공임대(5년, 10년, 분납임대) (SPL_INF_TP_CD=060),
			if(isset($resp['dsList01']))
			{
				$counter=0;
				if(isset($resp['dsList01'])){
					$counter = count($resp['dsList01']);
				}
				else{
					continue;
				}
				for($k=0;$k<$counter;$k++)
				{
					$data=$resp['dsList01'][$k]; 
					$sql="insert into lh_rent set 
						rt_id='',
						lh_id='".$row['lh_id']."',
						lh_type='dsList01',
						total_area='".$data['SPL_AR']."', 
						total_cnt='".$data['TOT_HSH_CNT']."',
						rt_build='".$data['HTY_NM']."',
						rt_name='".$data['BZDT_NM']."',
						ex_area='".$data['RSDN_DDO_AR']."',
						sales_price_avg='".$data['SIL_AMT']."',
						supply_cnt='".$data['SIL_HSH_CNT']."' "; 
					sql_query($sql); 
					$insert_index++;
				}
				/*
				[dsList01Nm]
				[SPL_AR] => 공급면적 : total_area
				[TOT_HSH_CNT] => 세대수 : total_cnt
				[HTY_NM] => 주택형 : rt_build
				[BZDT_NM] => 단지명 : rt_name
				[RSDN_DDO_AR] => 전용면적(㎡) : ex_area
				[SIL_AMT] => 평균분양가격(원) : sales_price_avg
				[SIL_HSH_CNT] => 금회공급세대수 : supply_cnt
				
				[dsList01]
				[SPL_AR] => 81.0305 
				[TOT_HSH_CNT] => 528 
				[HTY_NM] => 59.0000A 
				[BZDT_NM] => 평택고덕국제화계획 Aa39 
				[RSDN_DDO_AR] => 59.74 
				[SIL_AMT] => 303772000 
				[SIL_HSH_CNT] => 528 )
				*/
			}
			
			
			if(isset($resp['dsList02']))
			{
				$counter=0;
				if(isset($resp['dsList02'])){
					$counter = count($resp['dsList02']);
				}
				else{
					continue;
				}
				for($k=0;$k<$counter;$k++)
				{
					$data=$resp['dsList02'][$k]; 

					$sql="insert into lh_rent set 
						rt_id='',
						lh_id='".$row['lh_id']."',
						lh_type='dsList02',
						total_area='".$data['SPL_AR']."', 
						total_cnt='".$data['TOT_HSH_CNT']."',
						rent_price='".$data['MM_RFE']."' , 
						rt_build='".$data['HTY_NM']."',
						rt_name='".$data['BZDT_NM']."',
						ex_area='".$data['RSDN_DDO_AR']."',
						supply_cnt='".$data['SIL_HSH_CNT']."', 
						se_price='".$data['LS_GMY']."' "; 
					sql_query($sql); 
					$insert_index++;
					/*			
					[dsList02Nm]
					[SPL_AR] => 공급면적 : total_area
					[TOT_HSH_CNT] => 세대수 : total_cnt
					[MM_RFE] => 월임대료(원) : rent_price 
					[HTY_NM] => 주택형 : rt_build
					[BZDT_NM] => 단지명 : rt_name
					[RSDN_DDO_AR] => 전용면적(㎡) : ex_area
					[SIL_HSH_CNT] => 금회공급세대수 : supply_cnt
					[LS_GMY] => 임대보증금(원) : se_price

					[dsList02]
					[SPL_AR] => 96.9298 
					[TOT_HSH_CNT] => 496 
					[MM_RFE] => 365000 
					[HTY_NM] => 74.8800A 
					[BZDT_NM] => 충북혁신 B3(공임리츠) B3-1 
					[RSDN_DDO_AR] => 74.88 
					[SIL_HSH_CNT] => 421 
					[LS_GMY] => 35000000 ) 
					*/
				}
			} //end dsList02
		}else if($row['SPL_INF_TP_CD']=="051"){
			//분양주택-분양전환(SPL_INF_TP_CD=051)
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					rt_build='".$data['HTY_NNA']."',
					rt_name='".$data['SBD_LGO_NM']."',
					total_area='".$data['SPL_AR']."', 
					now_cnt='".$data['NOW_HSH_CNT']."',
					ex_area='".$data['DDO_AR']."',
					total_cnt = '".$data['HSH_CNT']."', 
					sales_price_avg='".$data['LS_GMY']."',
					supply_cnt='".$data['NOW_HSH_CNT']."' "; 
				sql_query($sql); 
				$insert_index++;
				/*
				[dsList01Nm]
				[DDO_AR] => 전용면적(㎡) : ex_area
				[NOW_HSH_CNT] => 금회공급 세대수 : supply_cnt
				[SPL_AR] => 공급면적 : total_area
				[SBD_LGO_NM] => 단지명 : rt_name
				[HSH_CNT] => 세대수 : total_cnt
				[HTY_NNA] => 주택형 : rt_build
				[LS_GMY] => 평균분양가격(원) : sales_price_avg

				[dsList01]
				[DDO_AR] => 83.8186 
				[NOW_HSH_CNT] => 5 
				[SPL_AR] => 109.4146 
				[SBD_LGO_NM] => 부여무지개 
				[HSH_CNT] => 10 
				[HTY_NNA] => 83.81 
				[LS_GMY] => 공고문 참조 
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="390"){
			//신혼희망타운(SPL_INF_TP_CD=390)
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					rt_build='".$data['BZDT_NM']."',
					rt_name='".$data['HTY_NM']."',
					total_area='".$data['SPL_AR']."', 
					total_cnt = '".$data['TOT_HSH_CNT']."', 
					ex_area='".$data['RSDN_DDO_AR']."',
					supply_cnt='".$data['SIL_HSH_CNT']."',
					sales_price_avg='".$data['SIL_AMT']."' "; 
				sql_query($sql); 
				$insert_index++;
				/*
				[dsList01Nm]
				[SPL_AR] => 공급면적 : total_area
				[TOT_HSH_CNT] => 세대수 : total_cnt 
				[HTY_NM] => 주택형 : rt_build
				[BZDT_NM] => 단지명 : rt_name
				[RSDN_DDO_AR] => 전용면적(㎡) : ex_area
				[SIL_AMT] => 평균분양가격(원) : sales_price_avg
				[SIL_HSH_CNT] => 금회공급세대수 : supply_cnt
				
				[dsList01]
				[SPL_AR] => 78.4955 
				[TOT_HSH_CNT] => 258 
				[HTY_NM] => 55.9800A 
				[BZDT_NM] => 화성능동 B-1 
				[RSDN_DDO_AR] => 55.98 
				[SIL_AMT] => 307970000 
				[SIL_HSH_CNT] => 169 
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="061" || $row['SPL_INF_TP_CD']=="062" || $row['SPL_INF_TP_CD']=="063" || ($row['SPL_INF_TP_CD']=="064" && $row['CCR_CNNT_SYS_DS_CD']=="03" ) ){
			/*
			임대주택-50년공공임대(SPL_INF_TP_CD=061), 국민임대 / 장기전세 / 신축다세대 / 영구임대(SPL_INF_TP_CD=062), 행복주택(SPL_INF_TP_CD=063), 가정어린이집(SPL_INF_TP_CD=064, CCR_CNNT_SYS_DS_CD=03)
			*/
			$counter = 0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					rt_build='".$data['HTY_NNA']."',
					rt_name='".$data['SBD_LGO_NM']."',
					total_area='".$data['SPL_AR']."', 
					ex_area='".$data['DDO_AR']."',
					supply_cnt='".$data['NOW_HSH_CNT']."',
					total_cnt = '".$data['HSH_CNT']."', 
					rent_price='".$data['RFE']."', 
					se_price='".$data['LS_GMY']."' "; 
				sql_query($sql); 
				$insert_index++;
		
				/*
				[dsList01Nm]
				[DDO_AR] => 전용면적(㎡) : ex_area
				[NOW_HSH_CNT] => 금회공급 세대수 : supply_cnt
				[RFE] => 월임대료(원) : rent_price 
				[SPL_AR] => 공급면적 : total_area
				[SBD_LGO_NM] => 단지명 : rt_name
				[HSH_CNT] => 세대수 : total_cnt
				[HTY_NNA] => 주택형 : rt_build
				[LS_GMY] => 임대보증금(원) : se_price

				[dsList01]
				[DDO_AR] => 37.67 
				[NOW_HSH_CNT] => 100 
				[RFE] => 공고문 참조 
				[SPL_AR] => 53.15 
				[SBD_LGO_NM] => 서삭석림 50년 공공임대 
				[HSH_CNT] => 387 
				[HTY_NNA] => 37.67 
				[LS_GMY] => 공고문 참조 
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="130"  ){
			/*
			청년신혼부부매입임대리츠(SPL_INF_TP_CD=130)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					address='".$data['SBD_CNP_NM']."',
					rt_build='".$data['HTY_DS_NM']."',
					rt_name='".$data['LTR_UNT_NM']."',
					recruit_cnt='".$data['GNR_SPL_RMNO']."',
					spare_cnt = '".$data['CAL_QUP_CNT']."',
					supply_cnt = '".$data['PZWR_CNT']."' ";
				sql_query($sql); 
				$insert_index++;
				/*
				[dsList01Nm]
				[PZWR_CNT] => 당첨자수 : supply_cnt
				[LTR_UNT_NM] => 상세지역 : address_detail
				[GNR_SPL_RMNO] => 공급호수 : recruit_cnt
				[CAL_QUP_CNT] => 예비자수 : spare_cnt
				[HTY_DS_NM] => 주택유형 : rt_build
				[SBD_CNP_NM] => 지역  : address

				[dsList01]
				[PZWR_CNT] => 11 
				[LTR_UNT_NM] => (강원원주시) 금광포란재1차 
				[GNR_SPL_RMNO] => 11 
				[CAL_QUP_CNT] => 44 
				[HTY_DS_NM] => 전용59㎡ 
				[SBD_CNP_NM] => 강원도 
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="131" ) {
			//청년매입임대(SPL_INF_TP_CD=131)
			if(isset($resp['dsList01']))
			{
				$counter=0;
				if(isset($resp['dsList01'])){
					$counter = count($resp['dsList01']);
				}
				else{
					continue;
				}
				for($k=0;$k<$counter;$k++)
				{
					$data=$resp['dsList01'][$k]; 
					$sql="insert into lh_rent set 
						rt_id='',
						lh_id='".$row['lh_id']."',
						lh_type='dsList01',
						rt_build='".$data['HTY_DS_NM']."',
						rt_name='".$data['SBD_LGO_ADR']."',
						address='".$data['SBD_LGO_NM']."',
						recruit_cnt='".$data['QUP_CNT']."',
						supply_cnt='".$data['GNR_SPL_RMNO	']."' "; 
					sql_query($sql); 
					$insert_index++;

					/*
					[dsList01Nm]
					SBD_LGO_NM	지자체명 : address
					SBD_LGO_ADR	주택정보 : rt_name
					HTY_DS_NM	주택유형 : rt_build
					GNR_SPL_RMNO	공급호수 : supply_cnt
					QUP_CNT	모집인원 : recruit_cnt
					*/
				}
			}
			
			if(isset($resp['dsList02']))
			{
				$counter=0;
				if(isset($resp['dsList02'])){
					$counter = count($resp['dsList02']);
				}
				else{
					continue;
				}

				for($k=0;$k<$counter;$k++)
				{
					$data=$resp['dsList02'][$k]; 

					$sql="insert into lh_rent set 
						rt_id='',
						lh_id='".$row['lh_id']."',
						lh_type='dsList02',
						rt_name='".$data['DNG_HS_ADR']."',
						address='".$data['CNP_NM']."',
						recruit_cnt='".$data['QUP_CNT']."',
						supply_cnt='".$data['LTR_SPL_RMNO']."',
						private_type='".$data['SX_PP_DS_NM']."' "; 
					sql_query($sql); 
					echo $sql;
					echo "<br><br>";
					$insert_index++;
				}
				
				/*
				[dsList02Nm]
				[DNG_HS_ADR] => 주택정보 :rt_name
				[CNP_NM] => 지자체명 :address
				[QUP_CNT] => 모집인원  :  recruit_cnt
				[LTR_SPL_RMNO] => 공급호수 :supply_cnt 
				[SX_PP_DS_NM] => 전용여부 : private_type

				[dsList02]
				[DNG_HS_ADR] => 청년매입임대(제주제주시) 
				[CNP_NM] => 제주특별자치도 
				[QUP_CNT] => 70 
				[LTR_SPL_RMNO] => 24 
				[SX_PP_DS_NM] => 해당없음
				*/
			} //end dsList02

		}else if($row['SPL_INF_TP_CD']=="132"  ){
			/*
			신혼부부매입임대(SPL_INF_TP_CD=132)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					address='".$data['SGG_NM']."' ,
					rt_name='".$data['DNG_HS_ADR']."',
					recruit_cnt='".$data['QUP_CNT']."',
					supply_cnt='".$data['LTR_SPL_RMNO']."' ";
				sql_query($sql); 
				$insert_index++;

				/*
				[dsList01Nm]
				[DNG_HS_ADR] => 주택정보 : rt_name
				[SGG_NM] => 지자체명 : address
				[QUP_CNT] => 모집인원 : recruit_cnt
				[LTR_SPL_RMNO] => 공급호수 : supply_cnt

				[dsList01]
				[DNG_HS_ADR] => 신혼부부매입임대2(경기용인시) 
				[SGG_NM] => 경기도 용인시 처인구 
				[QUP_CNT] => 96 
				[LTR_SPL_RMNO] => 32 
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="133"  ){
			/*
			집주인리모델링(SPL_INF_TP_CD=133)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					address='".$data['CNP_NM']."' ,
					address_detail='".$data['CNP_NM']."' ,
					rt_build='".$data['SBD_LGO_ADR']."',

					rt_name='".$data['SBD_LGO_ADR']."',
					recruit_cnt='".$data['QUP_CNT']."' ";
				sql_query($sql); 
				$insert_index++;
				/*
				[dsList01]
				[HTY_DS_NM] => 1형 : rt_build
				[SBD_LGO_ADR] => 부산광역시 금정구 기찰로102번길 41(부곡동) : address_detail, rt_name
				[CNP_NM] => 부산광역시 
				[QUP_CNT] => 9 

				[dsList01Nm] 
				[HTY_DS_NM] => 주택유형 
				[SBD_LGO_ADR] => 주택정보 
				[CNP_NM] => 시도 
				[QUP_CNT] => 모집인원 
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="134"  ){
			/*
			기숙사형매입임대(SPL_INF_TP_CD=134)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					address='".$data['CNP_NM']."',
					address_detail='".$data['DNG_HS_ADR']."',
					rt_name='".$data['DNG_HS_ADR']."',
					supply_cnt='".$data['LTR_SPL_RMNO']."',
					recruit_cnt='".$data['QUP_CNT']."',
					private_type='".$data['SX_PP_DS_NM']."' ";
				sql_query($sql); 
				$insert_index++;
				/*
				[dsList01Nm]
				[DNG_HS_ADR] => 주택정보  rt_name , address_detail
				[CNP_NM] => 지자체명 : address
				[QUP_CNT] => 모집인원 : recruit_cnt
				[LTR_SPL_RMNO] => 공급호수 : supply_cnt
				[SX_PP_DS_NM] => 전용여부 : private_type

				[dsList01]
				[DNG_HS_ADR] => 경기도 화성시 봉담읍 와우로 23-31 스마트오피스텔
				[CNP_NM] => 경기도
				[QUP_CNT] => 594
				[LTR_SPL_RMNO] => 198
				[SX_PP_DS_NM] => 해당없음
				*/
			}
		}else if($row['SPL_INF_TP_CD']=="135"  ){
			/*
			다가구매입임대(SPL_INF_TP_CD=135)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					rt_build='".$data['HTY_DS_NM']."',
					address='".$data['SBD_LGO_NM']."',
					rt_name='".$data['SBD_LGO_NM']."',
					private_type ='".$data['RQS_HSH_CNT']."',
					recruit_cnt = '".$data['QUP_CNT']."' ";
				sql_query($sql); 
				$insert_index++;
			}
			/*
			[dsList01Nm]
			[HTY_DS_NM] => 주택유형  rt_build
			[SBD_LGO_NM] => 모집지역 : address , rt_name
			[RQS_HSH_CNT] => 가구원수 : private_type 
			[QUP_CNT] => 모집인원 :recruit_cnt

			[dsList01]
			[HTY_DS_NM] => 1형 : rt_build 
			[SBD_LGO_NM] => 매입다가구(대구동구) address
			[RQS_HSH_CNT] => 2인 이하 가구  
			[QUP_CNT] => 100
			*/
		}else if($row['SPL_INF_TP_CD']=="136"  ){
			/*
			매입임대-장기미임대(SPL_INF_TP_CD=136)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',

					ex_area='".$data['DDO_AR']."',
					rt_name='".$data['SBD_LGO_NM']."',
					address='".$data['SBD_LGO_NM']."',
					address_detail='".$data['ADR']."',
					address_ho='".$data['HO_NO']."',
					address_floor='".$data['VLD_VL_NM']."' ";
				sql_query($sql); 
				$insert_index++;
			}
			/*
			[dsList01Nm]
			[DDO_AR] => 전용면적(㎡) ex_area
			[ADR] => 주소 address_detail
			[HO_NO] => 호 address_ho
			[VLD_VL_NM] => 층수 address_floor
			[SBD_LGO_NM] => 모집지역 address, rt_name

			[dsList01]
			[DDO_AR] => 24.3 
			[ADR] => 경기도 여주시 가남읍 태평4길 9-1 
			[HO_NO] => 301호 
			[VLD_VL_NM] => 3층 
			[SBD_LGO_NM] => 매입다가구(경기여주시) ) 
			*/
		}else if($row['SPL_INF_TP_CD']=="137"  ){
			/*
			– 청년전세임대(SPL_INF_TP_CD=137)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					address='".$data['SBD_LGO_NM']."',
					rt_name='".$data['CNP_NM']."', 
					private_type='".$data['STDT_CS_NM']."',  
					supply_cnt='".$data['TOT_RSDC_SPL_QOM']."',
					st_com_cnt='".$data['COP_RSDC_SPL_QOM']."',
					st_young_cnt='".$data['YT_OPE_SPL_QOM']."',
					st_univ_cnt='".$data['UST_SPL_QOM']."',
					st_work_cnt='".$data['EMPT_PPRT_OPE_SPL_QOM']."' ";
				sql_query($sql); 
				$insert_index++;
			}
			/*
			[dsList01Nm]
			[CNP_NM] => 지역본부 rt_name 
			[SBD_LGO_NM] => 지역(지자체) address
			[STDT_CS_NM] => 학생분류 private_type
			[YT_OPE_SPL_QOM] => 청년공급물량 st_young_cnt
			[COP_RSDC_SPL_QOM] => 공동거주공급물량 st_com_cnt
			[TOT_RSDC_SPL_QOM] => 총공급물량 supply_cnt
			[EMPT_PPRT_OPE_SPL_QOM] => 취업준비생공급물량 st_work_cnt
			[UST_SPL_QOM] => 대학생공급물량 st_univ_cnt

			[dsList01]
			[CNP_NM] => 서울지역본부 전세임대
			[SBD_LGO_NM] => 전세(서울종로구)
			[STDT_CS_NM] => 보호종료아동(청년 
			[YT_OPE_SPL_QOM] => 10
			[COP_RSDC_SPL_QOM] => 0
			[TOT_RSDC_SPL_QOM] => 10 
			[EMPT_PPRT_OPE_SPL_QOM] => 0
			[UST_SPL_QOM] => 0 
			*/
		}else if($row['SPL_INF_TP_CD']=="138"  ){
			/*
			– 신혼부부전세임대(SPL_INF_TP_CD=138)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					private_type='".$data['SBD_LGO_NM']."',
					rt_name='".$data['CNP_NM']."', 
					supply_cnt='".$data['TOT_RSDC_SPL_QOM']."' ";
				sql_query($sql); 
				$insert_index++;
			}
			/*
			[CNP_NM] => 지역본부 : rt_name
			[SBD_LGO_NM] => 지역 : private_type
			[TOT_RSDC_SPL_QOM] => 총공급물량 supply_cnt

			[CNP_NM] => 제주지역본부 전세임대  
			[SBD_LGO_NM] => 전세(제주서귀포시) 
			[TOT_RSDC_SPL_QOM] => 9 
			*/
		}else if($row['SPL_INF_TP_CD']=="139"  ){
			/*
			–기존주택전세임대(SPL_INF_TP_CD=139)
			*/
			$counter=0;
			if(isset($resp['dsList01'])){
				$counter = count($resp['dsList01']);
			}
			else{
				continue;
			}
			for($k=0;$k<$counter;$k++)
			{
				$data=$resp['dsList01'][$k]; 
				$sql="insert into lh_rent set 
					rt_id='',
					lh_id='".$row['lh_id']."',
					lh_type='dsList01',
					rt_name='".$data['SPL_CD_NM']."', 
					supply_cnt='".$data['SPL_QOM']."' ";
				sql_query($sql); 
				$insert_index++;
			}
			/*
				[SPL_QOM] => 
				[SPL_CD_NM] => 소년소녀가정 

				[SPL_QOM] => 공급호수 supply_cnt
				[SPL_CD_NM] => 전세유형 rt_name 
			*/
		}else{
			continue; 
		}

		//while 을 정의
		$sql= "update lh_notice 
		set lh_setting='1'
		where lh_id='{$row['lh_id']}'";
		sql_query($sql); 

		/*
		if($index > 5){
			exit();
		}
		*/
	}
	return $insert_index;
}
?>