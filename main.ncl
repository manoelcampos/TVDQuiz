<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<!---TVD Quiz (NCL principal da aplicação)
@author Ueslei Taivan - Faculdade Católica do Tocantins
@author Manoel Campos da Silva Filho  - Instituto Federal de Educação do Tocantins (http://manoelcampos.com) 
@license Atribuição-Uso não-comercial-Compartilhamento pela mesma licença http://creativecommons.org/licenses/by-nc-sa/2.5/br/
-->
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<transitionBase>
			<transition id="tFade" type="fade"/>
		</transitionBase>
		
		<regionBase>
            <region id="rgVideo" width="100%" height="100%" zIndex="0">
			 <region id="rgLua" width="100%" height="42%" left="0" top="58%" zIndex="1" />
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="dLua" region="rgLua" focusIndex="luaIdx" transIn="tFade" transOut="tFade" />
			
			<descriptor id="dVideo" region="rgVideo" />
		</descriptorBase>
		
		<connectorBase>
            <causalConnector id="onBeginStart">
                <simpleCondition role="onBegin"/>
                <simpleAction role="start"/>
            </causalConnector>  

            <causalConnector id="onKeySelectionSet">
            	<connectorParam name="key"/>
            	<connectorParam name="value"/>
	            
	            
                <simpleCondition role="onSelection" key="$key"/>
                <simpleAction role="set" value="$value"/>
            </causalConnector>  

			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd"/>
				<simpleAction role="start"/>
			</causalConnector>	
			
			<causalConnector id="onKeySelectionStop">
				<connectorParam name="key"/>
				<simpleCondition role="onSelection" key="$key"/>
				<simpleAction role="stop"/>
			</causalConnector>
			
			<causalConnector id="onBeginStop">
				<simpleCondition role="onBegin"/>
				<simpleAction role="stop"/>
			</causalConnector>
			
		</connectorBase>			
	</head>

	<body>
		<port id="pVideo" component="video1"/>
		
        <media type="application/x-ginga-settings" id="programSettings">
            <property name="service.currentKeyMaster" value="luaIdx"/>
        </media>

		
        <!--Vídeo sob licença Creative Commons, obtido em http://creativecommons.org/video -->
		<media id="video1" src="media/Wanna_Work_Together_-_Creative_Commons.avi" descriptor="dVideo">
			
		</media>
		  
		<media id="lua" src="main.lua" descriptor="dLua">
			<property name="finalizar"/>
		</media>
	
	    <link xconnector="onBeginStart">
			<bind role="onBegin" component="video1" />
			<bind role="start" component="lua" />
	    </link>
	    
	    <link xconnector="onKeySelectionSet">
	    	<bind role="onSelection" component="video1">
		    	<bindParam name="key" value="GREEN"/>
		    </bind>
	    		
	    	<bind role="set" component="lua" interface="finalizar">
		    	<bindParam name="value" value="true"/>
		    </bind>
	    </link>
	       	
		<link xconnector="onEndStart">
			<bind component="video1" role="onEnd" />
			<bind component="video1" role="start" />				
		</link>
		
		<link xconnector="onKeySelectionStop">
			<bind component="video1" role="onSelection">
				<bindParam name="key" value="RED"/>				
			</bind>
			<bind component="lua" role="stop" />
		</link>
		</body>
</ncl>
