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

/* layout/parts/login/config_login.html.twig */
class __TwigTemplate_aa443ef8be5cd7e83bd78f5051ee6ab5 extends Template
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
            $context["css_files"] = [["path" => "public/lib/base.css"], ["path" => "public/lib/main.css"], ["path" => "public/lib/vendor/bootstrap/css/bootstrap.min.css"], ["path" => "public/lib/vendor/animate/animate.css"], ["path" => "public/lib/vendor/css-hamburgers/hamburgers.min.css"], ["path" => "public/lib/vendor/css-hamburgers/hamburgers.min.css"], ["path" => "public/lib/vendor/animsition/css/animsition.min.css"], ["path" => "public/lib/vendor/select2/select2.min.css"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.css"], ["path" => "public/lib/fonts/font-awesome-4.7.0/css/font-awesome.min.css"], ["path" => "public/lib/fonts/iconic/css/material-design-iconic-font.min.css"]];
            // line 50
            yield "   ";
            // line 51
            yield "
";
        }
        // line 53
        if ( !array_key_exists("js_files", $context)) {
            // line 54
            yield "   ";
            $context["js_files"] = [["path" => "public/lib/vendor/jquery/jquery-3.2.1.min.js"], ["path" => "public/lib/vendor/animsition/js/animsition.min.js\""], ["path" => "public/lib/vendor/bootstrap/js/popper.js"], ["path" => "public/lib/vendor/bootstrap/js/bootstrap.min.js"], ["path" => "public/lib/vendor/select2/select2.min.js"], ["path" => "public/lib/vendor/daterangepicker/moment.min.js"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.js"], ["path" => "public/lib/vendor/countdowntime/countdowntime.js"], ["path" => "public/lib/js/main.js"]];
        }
        // line 68
        if ( !array_key_exists("js_modules", $context)) {
            // line 69
            yield "   ";
            $context["js_modules"] = [];
        }
        // line 71
        if ( !array_key_exists("custom_header_tags", $context)) {
            // line 72
            yield "   ";
            $context["custom_header_tags"] = [];
        }
        // line 74
        yield "
";
        // line 76
        $context["js_files"] = Twig\Extension\CoreExtension::merge(($context["js_files"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsScriptsFiles(true));
        // line 77
        $context["js_modules"] = Twig\Extension\CoreExtension::merge(($context["js_modules"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsModulesFiles(true));
        // line 78
        yield "
";
        // line 79
        $context["is_anonymous_page"] = true;
        // line 80
        yield "
";
        // line 81
        yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/head.html.twig");
        yield "
<body>
     <div>
     
            ";
        // line 85
        yield from $this->unwrap()->yieldBlock('content_block', $context, $blocks);
        // line 86
        yield "            <div class=\"text-center text-muted mt-3\">
               ";
        // line 87
        yield from $this->unwrap()->yieldBlock('footer_block', $context, $blocks);
        // line 88
        yield "            </div>

    </div>

           

   ";
        // line 94
        yield from $this->unwrap()->yieldBlock('javascript_block', $context, $blocks);
        // line 95
        yield "</body>
</html>


";
        return; yield '';
    }

    // line 85
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 87
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 94
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
        return "layout/parts/login/config_login.html.twig";
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
        return array (  137 => 94,  130 => 87,  123 => 85,  114 => 95,  112 => 94,  104 => 88,  102 => 87,  99 => 86,  97 => 85,  90 => 81,  87 => 80,  85 => 79,  82 => 78,  80 => 77,  78 => 76,  75 => 74,  71 => 72,  69 => 71,  65 => 69,  63 => 68,  59 => 54,  57 => 53,  53 => 51,  51 => 50,  48 => 36,  46 => 35,  44 => 34,  41 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("", "layout/parts/login/config_login.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\layout\\parts\\login\\config_login.html.twig");
    }
}
