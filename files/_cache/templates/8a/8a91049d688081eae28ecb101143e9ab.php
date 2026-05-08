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
            $context["css_files"] = [["path" => "public/lib/base.css"], ["path" => "public/lib/main.css"], ["path" => "public/lib/vendor/bootstrap/css/bootstrap.min.css"], ["path" => "public/lib/vendor/animate/animate.css"], ["path" => "public/lib/vendor/css-hamburgers/hamburgers.min.css"], ["path" => "public/lib/vendor/css-hamburgers/hamburgers.min.css"], ["path" => "public/lib/vendor/animsition/css/animsition.min.css"], ["path" => "public/lib/vendor/select2/select2.min.css"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.css"], ["path" => "public/lib/fonts/font-awesome-4.7.0/css/font-awesome.min.css"], ["path" => "public/lib/fonts/iconic/css/material-design-iconic-font.min.css"], ["path" => "public/lib/util.css"], ["path" => (("css/palettes/" .             // line 50
($context["theme"] ?? null)) . ".scss")]];
            // line 52
            yield "   ";
            // line 53
            yield "
";
        }
        // line 55
        if ( !array_key_exists("js_files", $context)) {
            // line 56
            yield "   ";
            $context["js_files"] = [["path" => "public/lib/base.js"], ["path" => "js/common.js"], ["path" => "public/lib/fuzzy.js"], ["path" => "public/lib/vendor/jquery/jquery-3.2.1.min.js"], ["path" => "public/lib/vendor/animsition/js/animsition.min.js\""], ["path" => "public/lib/vendor/bootstrap/js/popper.js"], ["path" => "public/lib/vendor/bootstrap/js/bootstrap.min.js"], ["path" => "public/lib/vendor/select2/select2.min.js"], ["path" => "public/lib/vendor/daterangepicker/moment.min.js"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.js"], ["path" => "public/lib/vendor/countdowntime/countdowntime.js"], ["path" => "public/lib/js/main.js"]];
        }
        // line 74
        if ( !array_key_exists("js_modules", $context)) {
            // line 75
            yield "   ";
            $context["js_modules"] = [];
        }
        // line 77
        if ( !array_key_exists("custom_header_tags", $context)) {
            // line 78
            yield "   ";
            $context["custom_header_tags"] = [];
        }
        // line 80
        yield "
";
        // line 82
        $context["js_files"] = Twig\Extension\CoreExtension::merge(($context["js_files"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsScriptsFiles(true));
        // line 83
        $context["js_modules"] = Twig\Extension\CoreExtension::merge(($context["js_modules"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsModulesFiles(true));
        // line 84
        yield "
";
        // line 85
        $context["is_anonymous_page"] = true;
        // line 86
        yield "
";
        // line 87
        yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/head.html.twig");
        yield "
<body class=\"welcome-anonymous\">
   <div class=\"page-anonymous\">
      <div class=\"flex-fill d-flex flex-column justify-content-center py-4 mt-4\">
         ";
        // line 91
        $context["style"] = null;
        // line 92
        yield "         ";
        if (array_key_exists("card_md_width", $context)) {
            // line 93
            yield "            ";
            $context["style"] = "max-width: 40rem";
            // line 94
            yield "         ";
        }
        // line 95
        yield "         ";
        if (array_key_exists("card_bg_width", $context)) {
            // line 96
            yield "            ";
            $context["style"] = "max-width: 60rem";
            // line 97
            yield "         ";
        }
        // line 98
        yield "
         <div class=\"container-tight py-6\" ";
        // line 99
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
        // line 107
        yield from $this->unwrap()->yieldBlock('content_block', $context, $blocks);
        // line 108
        yield "               </div>
            </div>

            <div class=\"text-center text-muted mt-3\">
               ";
        // line 112
        yield from $this->unwrap()->yieldBlock('footer_block', $context, $blocks);
        // line 113
        yield "            </div>
         </div>
      </div>
   </div>

   ";
        // line 118
        yield from $this->unwrap()->yieldBlock('javascript_block', $context, $blocks);
        // line 119
        yield "</body>
</html>


";
        return; yield '';
    }

    // line 107
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 112
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 118
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
        return array (  178 => 118,  171 => 112,  164 => 107,  155 => 119,  153 => 118,  146 => 113,  144 => 112,  138 => 108,  136 => 107,  121 => 99,  118 => 98,  115 => 97,  112 => 96,  109 => 95,  106 => 94,  103 => 93,  100 => 92,  98 => 91,  91 => 87,  88 => 86,  86 => 85,  83 => 84,  81 => 83,  79 => 82,  76 => 80,  72 => 78,  70 => 77,  66 => 75,  64 => 74,  60 => 56,  58 => 55,  54 => 53,  52 => 52,  50 => 50,  48 => 36,  46 => 35,  44 => 34,  41 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("", "layout/page_card_notlogged.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\layout\\page_card_notlogged.html.twig");
    }
}
