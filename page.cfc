component persistent="true" {

	property name="id" fieldtype="id" generator="increment";
	property name="attributes" ormtype="string";     
	property name="value" ormtype="string";
	property name="pageUrl" ormtype="string";

    function getName() {
		return uCase( variables.name );
	}

}