tinymce.PluginManager.add("autosave",function(e){function t(e,t){var n={s:1e3,m:6e4};return e=/^(\d+)([ms]?)$/.exec(""+(e||t)),(e[2]?n[e[2]]:1)*parseInt(e,10)}function n(){var e=parseInt(l.getItem(d+"time"),10)||0;return(new Date).getTime()-e>v.autosave_retention?(a(!1),!1):!0}function a(t){l.removeItem(d+"draft"),l.removeItem(d+"time"),t!==!1&&e.fire("RemoveDraft")}function r(){!c()&&e.isDirty()&&(l.setItem(d+"draft",e.getContent({format:"raw",no_events:!0})),l.setItem(d+"time",(new Date).getTime()),e.fire("StoreDraft"))}function o(){n()&&(e.setContent(l.getItem(d+"draft"),{format:"raw"}),e.fire("RestoreDraft"))}function i(){m||(setInterval(function(){e.removed||r()},v.autosave_interval),m=!0)}function s(){var t=this;t.disabled(!n()),e.on("StoreDraft RestoreDraft RemoveDraft",function(){t.disabled(!n())}),i()}function u(){e.undoManager.beforeChange(),o(),a(),e.undoManager.add()}function f(){var e;return tinymce.each(tinymce.editors,function(t){t.plugins.autosave&&t.plugins.autosave.storeDraft(),!e&&t.isDirty()&&t.getParam("autosave_ask_before_unload",!0)&&(e=t.translate("You have unsaved changes are you sure you want to navigate away?"))}),e}function c(t){var n=e.settings.forced_root_block;return t=tinymce.trim("undefined"==typeof t?e.getBody().innerHTML:t),""===t||new RegExp("^<"+n+"[^>]*>(( |&nbsp;|[ 	]|<br[^>]*>)+?|)</"+n+">|<br>$","i").test(t)}var d,m,v=e.settings,l=tinymce.util.LocalStorage;d=v.autosave_prefix||"tinymce-autosave-{path}{query}-{id}-",d=d.replace(/\{path\}/g,document.location.pathname),d=d.replace(/\{query\}/g,document.location.search),d=d.replace(/\{id\}/g,e.id),v.autosave_interval=t(v.autosave_interval,"30s"),v.autosave_retention=t(v.autosave_retention,"20m"),e.addButton("restoredraft",{title:"Restore last draft",onclick:u,onPostRender:s}),e.addMenuItem("restoredraft",{text:"Restore last draft",onclick:u,onPostRender:s,context:"file"}),e.settings.autosave_restore_when_empty!==!1&&(e.on("init",function(){n()&&c()&&o()}),e.on("saveContent",function(){a()})),window.onbeforeunload=f,this.hasDraft=n,this.storeDraft=r,this.restoreDraft=o,this.removeDraft=a,this.isEmpty=c});