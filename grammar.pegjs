{
	// 将页面数据按照 parentModule 进行分组
    const pagesByParentModule = (pages) => pages.reduce((acc, page) => {
      if (!acc[page.parentModule]) {
        acc[page.parentModule] = [];
      }
      acc[page.parentModule].push({
        moduleName: page.pageName,
        moduleTitle: page.pageTitle,
        childrenModule: [],
      });
      return acc;
    }, {});

    // 递归函数，用于将 moduleTree 转换成所需的格式
    function transformModule(module,pages) {
      const transformedChildren = module.childrenModule.map(item => transformModule(item,pages));
      const pagesForModule = pagesByParentModule(pages)[module.moduleName] || [];
      return {
        moduleName: module.moduleName,
        moduleTitle: module.moduleTitle,
        childrenModule: [...transformedChildren, ...pagesForModule],
      };
    }
}
start =
    modules: modulesDefinition
    pages: pageDefinitions
    {
    	return	{
        	moduleName: "root",
 			childrenModule: [
            	...modules.map(item => transformModule(item,pages)),
                ...pagesByParentModule(pages)[""].map((page) => (page)),
            ]
        }
    }
    
modulesDefinition = "define" ws "modules" ws "{" modules: moduleDefinition* "}" ws {
	return modules
}
                  
moduleDefinition = moduleName:name childrenModule:("{" asd:moduleDefinition* "}")* ws "#" moduleTitle:title {
	return {
    	moduleName: String(moduleName).replace(/[ \t\n\r,]/g,""),
        moduleTitle: String(moduleTitle).replace(/[ \t\n\r,]/g,""),
        childrenModule:(childrenModule[0]&&childrenModule[0][0])?childrenModule[0][1]:[],
    }
}

pageDefinitions = pageDefinition*

pageDefinition = "define" ws "page" ws moduleName:(name ".")? pageName:name ws "#" pageTitle:title ";" ws {
	return {
    	parentModule:moduleName?String(moduleName).replace(/[ \t\n\r,\.]/g,""):"",
    	pageName: String(pageName).replace(/[ \t\n\r,]/g,""),
        pageTitle: String(pageTitle).replace(/[ \t\n\r,]/g,"")
    }
}

name = ws [a-zA-Z0-9]* ws
title = text ws
ws = [ \t\n\r]*
text = [a-zA-Z0-9\u4E00-\u9FA5]+