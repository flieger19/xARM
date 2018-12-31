<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Identifier</key>
	<string>de.cdullo.XarmBasic.xcode4.template</string>
	<key>Concrete</key>
	<true/>
	<key>Description</key>
	<string>This template builds an basic ARM C project</string>
	<key>SorterOrder</key>
	<integer>1</integer>
	<key>Platforms</key>
	<array>
		<string>com.apple.platform.macosx</string>
	</array>
	<key>AllowedTypes</key>
	<array>
		<string>public.c-header</string>
		<string>public.c-source</string>
	</array>
	<key>Ancestors</key>
	<array>
		<string>com.apple.dt.unit.base</string>
	</array>
	<key>Definitions</key>
	<dict>
		<key>main.c</key>
		<dict>
			<key>Path</key>
			<string>main.c</string>
		</dict>
		<key>___VARIABLE_MCU____conf.h</key>
		<dict>
			<key>Path</key>
			<string>___VARIABLE_MCU____conf.h</string>
			<key>Group</key>
			<array>
				<string>Configuration</string>
			</array>
		</dict>
		<key>startup____VARIABLE_MCU___.c</key>
		<dict>
			<key>Path</key>
			<string>startup____VARIABLE_MCU___.c</string>
			<key>Group</key>
			<array>
				<string>Startup</string>
			</array>
		</dict>
		<key>system____VARIABLE_MCU___.c</key>
		<dict>
			<key>Path</key>
			<string>system____VARIABLE_MCU___.c</string>
			<key>Group</key>
			<array>
				<string>Startup</string>
			</array>
		</dict>
		<key>Makefile</key>
		<dict>
			<key>Path</key>
			<string>Makefile</string>
			<key>Group</key>
			<array>
				<string>Makefiles</string>
			</array>
			<key>TargetIndices</key>
			<array/>
		</dict>
		<key>LDScript.ld</key>
		<dict>
			<key>Path</key>
			<string>LDScript.ld</string>
			<key>Group</key>
			<array>
				<string>Scripts</string>
			</array>
			<key>TargetIndices</key>
			<array/>
		</dict>
	</dict>
	<key>Nodes</key>
	<array>
		<string>main.c</string>
		<string>___VARIABLE_MCU____conf.h</string>
		<string>startup____VARIABLE_MCU___.c</string>
		<string>system____VARIABLE_MCU___.c</string>
		<string>Makefile</string>
		<string>LDScript.ld</string>
	</array>
	<key>Project</key>
	<dict>
		<key>Configurations</key>
		<dict>
			<key>Debug</key>
			<dict/>
			<key>Release</key>
			<dict/>
		</dict>
		<key>SharedSettings</key>
		<dict>
			<key>PATH</key>
			<string>$(PATH):$(PROJECT_DIR)</string>
			<key>HEADER_SEARCH_PATHS</key>
			<string>$(HOME)/Library/Developer/Platforms/___VARIABLE_MCU___.platform/include/core</string>
			<key>LIBRARIEN_SOURCES</key>
			<string></string>
			<key>PRODUCT_NAME</key>
			<string>$(TARGET_NAME)</string>
		</dict>
	</dict>
	<key>Targets</key>
	<array>
		<dict>
			<key>Name</key>
			<string>All</string>
			<key>BuildToolPath</key>
			<string>make</string>
			<key>TargetType</key>
			<string>Legacy</string>
			<key>BuildToolArgsString</key>
			<string>all -C &quot;$(PROJECT)&quot;</string>
		</dict>
		<dict>
			<key>Name</key>
			<string>Build</string>
			<key>TargetType</key>
			<string>Legacy</string>
			<key>BuildToolPath</key>
			<string>make</string>
			<key>BuildToolArgsString</key>
			<string>build -C &quot;$(PROJECT)&quot;</string>
		</dict>
		<dict>
			<key>Name</key>
			<string>Upload</string>
			<key>TargetType</key>
			<string>Legacy</string>
			<key>BuildToolPath</key>
			<string>make</string>
			<key>BuildToolArgsString</key>
			<string>program -C &quot;$(PROJECT)&quot;</string>
		</dict>
		<dict>
			<key>Name</key>
			<string>Clean</string>
			<key>TargetType</key>
			<string>Legacy</string>
			<key>BuildToolPath</key>
			<string>make</string>
			<key>BuildToolArgsString</key>
			<string>clean -C &quot;$(PROJECT)&quot;</string>
		</dict>
		<dict>
			<key>ProductType</key>
			<string>com.apple.product-type.tool</string>
			<key>Name</key>
			<string>Index</string>
			<key>Configurations</key>
			<dict>
				<key>Debug</key>
				<dict/>
				<key>Release</key>
				<dict/>
			</dict>
			<key>BuildPhases</key>
			<array>
				<dict>
					<key>Class</key>
					<string>Sources</string>
				</dict>
			</array>
		</dict>
	</array>
	<key>Options</key>
	<array>
		<dict>
			<key>Default</key>
			<string>stm32f0xx</string>
			<key>Description</key>
			<string>Microcontroller</string>
			<key>Identifier</key>
			<string>MCU</string>
			<key>Name</key>
			<string>MCU</string>
			<key>SortOrder</key>
			<integer>1</integer>
			<key>Type</key>
			<string>popup</string>
			<key>Units</key>
			<dict>
                
                
                
                @iter mcus@
				<key>{mcu}</key>
				<dict>
					<key>Project</key>
					<dict>
						<key>Configurations</key>
						<dict>
							<key>Debug</key>
							<dict>
								<key>CFLAGS</key>
								<string>-g -O0 -mcpu={mcpu} -D{MCU}_MD</string>
								<key>OTHER_LINKER_FLAGS</key>
								<string>-mcpu={mcpu}</string>
							</dict>
							<key>Release</key>
							<dict>
								<key>GCC_PREPROCESSOR_DEFINITIONS</key>
								<string>-O2 -mcpu={mcpu} -D{MCU}_MD</string>
								<key>OTHER_LINKER_FLAGS</key>
								<string>-mcpu={mcpu}</string>
							</dict>
						</dict>
					</dict>
				</dict>
                
                @end@
                
                
                
			</dict>
		</dict>
	</array>
</dict>
</plist>
