templates = {};
templates.configure = new Hogan.Template(function(c,p,i){var _=this;_.b(i=i||"");_.b("<p id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_enabled\" class=\"configure\">");_.b("\n" + i);_.b("  <span class=\"prefix\">");_.b(_.v(_.f("displayName",c,p,0)));_.b(" :</span>");_.b("\n" + i);_.b("  <input name=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_n\" id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_n\" value='");_.b(_.v(_.f("n",c,p,0)));_.b("' maxlength='3'>");_.b("\n" + i);_.b("  <label for=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_n\">steps</label>");_.b("\n" + i);_.b("  <label for=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_s\">from</label>");_.b("\n" + i);_.b("  <input name=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_s\" id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_s\" value='");_.b(_.v(_.f("s",c,p,0)));_.b("' maxlength='5'>");_.b("\n" + i);_.b("  <label for=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_e\">to</label>");_.b("\n" + i);_.b("  <input name=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_e\" id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_e\" value='");_.b(_.v(_.f("e",c,p,0)));_.b("' maxlength='5'>");_.b("\n" + i);_.b("  <span id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_slider_dynamic\"></span>");_.b("\n" + i);_.b("  <br>");_.b("\n" + i);_.b("  <label for=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_reverse\">Reverse: </label>");_.b("\n" + i);_.b("  <input name=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_reverse\", id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_reverse\" type=\"checkbox\">");_.b("\n" + i);_.b("</p>");_.b("\n" + i);_.b("<p id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_disabled\" class=\"configure\">");_.b("\n" + i);_.b("  <label for=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_static\" class=\"prefix\">");_.b(_.v(_.f("displayName",c,p,0)));_.b(" :</label>");_.b("\n" + i);_.b("  <input name=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_static\" id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_static\" value='");_.b(_.v(_.f("static",c,p,0)));_.b("' maxlength='5'>");_.b("\n" + i);_.b("  <span id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("_slider_static\"></span>");_.b("\n" + i);_.b("</p>");return _.fl();;});
templates.controller = new Hogan.Template(function(c,p,i){var _=this;_.b(i=i||"");_.b(_.rp("palletOptions",c,p,""));_.b(_.rp("outputOptions",c,p,""));return _.fl();;});
templates.outputOptions = new Hogan.Template(function(c,p,i){var _=this;_.b(i=i||"");_.b("<h2>Output format settings</h2>");_.b("\n" + i);if(_.s(_.f("outputOptionsConfigures",c,p,1),c,p,0,60,211,"{{ }}")){_.rs(c,p,function(c,p,_){_.b("<p class=\"configure\">");_.b("\n" + i);_.b("  <label for=\"");_.b(_.v(_.f("name",c,p,0)));_.b("\" class=\"prefix\">");_.b(_.v(_.f("displayName",c,p,0)));_.b(" :</label>");_.b("\n" + i);_.b("  <input name=\"");_.b(_.v(_.f("name",c,p,0)));_.b("\" id=\"");_.b(_.v(_.f("name",c,p,0)));_.b("\" value=\"");_.b(_.v(_.f("value",c,p,0)));_.b("\">");_.b("\n" + i);_.b("</p>");_.b("\n");});c.pop();}return _.fl();;});
templates.palletOptions = new Hogan.Template(function(c,p,i){var _=this;_.b(i=i||"");_.b("<h2>Pallet options</h2>");_.b("\n" + i);_.b("<p>");_.b("\n" + i);_.b("  <label class=\"prefix\" for='pallet_mode'>Pallet mode :</label>");_.b("\n" + i);_.b("  <select id='pallet_mode', name='pallet_mode'>");_.b("\n" + i);if(_.s(_.f("palletModes",c,p,1),c,p,0,158,261,"{{ }}")){_.rs(c,p,function(c,p,_){_.b("    <option value=\"");_.b(_.v(_.f("name",c,p,0)));_.b("\" ");if(_.s(_.f("selected",c,p,1),c,p,0,201,220,"{{ }}")){_.rs(c,p,function(c,p,_){_.b("selected=\"selected\"");});c.pop();}_.b(">");_.b(_.v(_.f("displayName",c,p,0)));_.b("</option>");_.b("\n");});c.pop();}_.b("  </select>");_.b("\n" + i);_.b("</p>");_.b("\n" + i);_.b("\n" + i);if(_.s(_.f("palletOptionsConfigures",c,p,1),c,p,0,324,340,"{{ }}")){_.rs(c,p,function(c,p,_){_.b(_.rp("configure",c,p,""));});c.pop();}return _.fl();;});