<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\CoreExtension;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* layout/page_card_notlogged.html.twig */
class __TwigTemplate_2fbc39825c0fcdaa7196173ad484e50d extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
            'content_block' => [$this, 'block_content_block'],
            'footer_block' => [$this, 'block_footer_block'],
            'javascript_block' => [$this, 'block_javascript_block'],
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 33
        yield "
";
        // line 34
        $context["theme"] = $this->extensions['Glpi\Application\View\Extension\ConfigExtension']->config("palette");
        // line 35
        if ( !array_key_exists("css_files", $context)) {
            // line 36
            yield "   ";
            $context["css_files"] = [["path" => "public/lib/util.css"], ["path" => (("css/palettes/" .             // line 39
($context["theme"] ?? null)) . ".scss")]];
            // line 41
            yield "   ";
            // line 42
            yield "
";
        }
        // line 44
        if ( !array_key_exists("js_files", $context)) {
            // line 45
            yield "   ";
            $context["js_files"] = [["path" => "public/lib/base.js"], ["path" => "js/common.js"], ["path" => "public/lib/fuzzy.js"]];
        }
        // line 53
        if ( !array_key_exists("js_modules", $context)) {
            // line 54
            yield "   ";
            $context["js_modules"] = [];
        }
        // line 56
        if ( !array_key_exists("custom_header_tags", $context)) {
            // line 57
            yield "   ";
            $context["custom_header_tags"] = [];
        }
        // line 59
        yield "
";
        // line 61
        $context["js_files"] = Twig\Extension\CoreExtension::merge(($context["js_files"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsScriptsFiles(true));
        // line 62
        $context["js_modules"] = Twig\Extension\CoreExtension::merge(($context["js_modules"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsModulesFiles(true));
        // line 63
        yield "
";
        // line 64
        $context["is_anonymous_page"] = true;
        // line 65
        yield "
";
        // line 66
        yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/head.html.twig");
        yield "
<body class=\"welcome-anonymous\">
   <div class=\"page-anonymous\">
      <div class=\"flex-fill d-flex flex-column justify-content-center py-4 mt-4\">
         ";
        // line 70
        $context["style"] = null;
        // line 71
        yield "         ";
        if (array_key_exists("card_md_width", $context)) {
            // line 72
            yield "            ";
            $context["style"] = "max-width: 40rem";
            // line 73
            yield "         ";
        }
        // line 74
        yield "         ";
        if (array_key_exists("card_bg_width", $context)) {
            // line 75
            yield "            ";
            $context["style"] = "max-width: 60rem";
            // line 76
            yield "         ";
        }
        // line 77
        yield "
         <div class=\"container-tight py-6\" ";
        // line 78
        if ( !(null === ($context["style"] ?? null))) {
            yield "style=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["style"] ?? null), "html", null, true);
            yield "\"";
        }
        yield ">
            <div class=\"text-center\">
               <div class=\"col-md\">
                  <span class=\"glpi-logo mb-4\" title=\"GLPI\"></span>
               </div>
            </div>
            <div class=\"card card-md\">
               <div class=\"card-body\">
               ";
        // line 86
        yield from $this->unwrap()->yieldBlock('content_block', $context, $blocks);
        // line 87
        yield "               </div>
            </div>

            <div class=\"text-center text-muted mt-3\">
               ";
        // line 91
        yield from $this->unwrap()->yieldBlock('footer_block', $context, $blocks);
        // line 92
        yield "            </div>
         </div>
      </div>
   </div>

   ";
        // line 97
        yield from $this->unwrap()->yieldBlock('javascript_block', $context, $blocks);
        // line 98
        yield "</body>
</html>


";
        return; yield '';
    }

    // line 86
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 91
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 97
    public function block_javascript_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "layout/page_card_notlogged.html.twig";
    }

    /**
     * @codeCoverageIgnore
     */
    public function isTraitable()
    {
        return false;
    }

    /**
     * @codeCoverageIgnore
     */
    public function getDebugInfo()
    {
        return array (  178 => 97,  171 => 91,  164 => 86,  155 => 98,  153 => 97,  146 => 92,  144 => 91,  138 => 87,  136 => 86,  121 => 78,  118 => 77,  115 => 76,  112 => 75,  109 => 74,  106 => 73,  103 => 72,  100 => 71,  98 => 70,  91 => 66,  88 => 65,  86 => 64,  83 => 63,  81 => 62,  79 => 61,  76 => 59,  72 => 57,  70 => 56,  66 => 54,  64 => 53,  60 => 45,  58 => 44,  54 => 42,  52 => 41,  50 => 39,  48 => 36,  46 => 35,  44 => 34,  41 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("", "layout/page_card_notlogged.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\layout\\page_card_notlogged.html.twig");
    }
}
