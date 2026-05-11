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

/* pages/login.html.twig */
class __TwigTemplate_a016ae1c8d16e6363376b774b8fa870f extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->blocks = [
            'content_block' => [$this, 'block_content_block'],
            'footer_block' => [$this, 'block_footer_block'],
            'javascript_block' => [$this, 'block_javascript_block'],
        ];
    }

    protected function doGetParent(array $context)
    {
        // line 34
        return "layout/parts/login/config_login.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        $this->parent = $this->loadTemplate("layout/parts/login/config_login.html.twig", "pages/login.html.twig", 34);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
    }

    // line 36
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 37
        yield "  
         <div class=\"limiter\">
            <div class=\"container-login100\">
               <div class=\"wrap-login100\">
               <form action=\"";
        // line 41
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path("front/login.php"), "html", null, true);
        yield "\" method=\"post\" autocomplete=\"off\"  data-submit-once>
                  <input type=\"hidden\" name=\"noAUTO\" value=\"";
        // line 42
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["noAuto"] ?? null), "html", null, true);
        yield "\" />
                 <input type=\"hidden\" name=\"redirect\" value=\"";
        // line 43
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["redirect"] ?? null), "html", null, true);
        yield "\" />
                  <input type=\"hidden\" name=\"_glpi_csrf_token\" value=\"";
        // line 44
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(Session::getNewCSRFToken(), "html", null, true);
        yield "\" />
                  
                     <span class=\"login100-form-title p-b-48\">
                        
                        <img src=\"public/images/INCV_Slogan_principal_policromatica.png\" alt=\"\">
                     </span>

                     <div class=\"wrap-input100 validate-input\">
                        <input class=\"input100\" type=\"text\" id=\"login_name\" name=\"";
        // line 52
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["namfield"] ?? null), "html", null, true);
        yield "\" placeholder=\"\" tabindex=\"1\">
                        <span class=\"focus-input100\" data-placeholder=\"Email\"></span>
                     </div>
                    
                     <div class=\"wrap-input100 validate-input\" data-validate=\"Enter password\">
                        <span class=\"btn-show-pass\">
                           <i class=\"zmdi zmdi-eye\"></i>
                        </span>

                        
                        <input class=\"input100\" type=\"password\" id=\"login_password\" name=\"";
        // line 62
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["pwdfield"] ?? null), "html", null, true);
        yield "\" placeholder=\"\" autocomplete=\"off\" tabindex=\"2\">
                        <span class=\"focus-input100\" data-placeholder=\"Password\"></span>
                        
                     </div>

                     ";
        // line 67
        if (Twig\Extension\CoreExtension::constant("GLPI_DEMO_MODE")) {
            // line 68
            yield "                        <div class=\"mb-3\" hidden>
                           <label class=\"form-label\" for=\"dropdown_language";
            // line 69
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["rand"] ?? null), "html", null, true);
            yield "\">";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Language"), "html", null, true);
            yield "</label>
                           ";
            // line 70
            yield ($context["languages_dropdown"] ?? null);
            yield "
                        </div>
                     ";
        }
        // line 73
        yield "
                     ";
        // line 74
        if ($this->extensions['Glpi\Application\View\Extension\ConfigExtension']->config("display_login_source")) {
            // line 75
            yield "                        <div class=\"mb-3\" hidden>
                           <label class=\"form-label\" for=\"dropdown_auth";
            // line 76
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["rand"] ?? null), "html", null, true);
            yield "\">";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Login source"), "html", null, true);
            yield "</label>
                           ";
            // line 77
            yield ($context["auth_dropdown_login"] ?? null);
            yield "
                        </div>
                     ";
        }
        // line 80
        yield "

                     <div class=\"container-login100-form-btn\">
                        <div class=\"wrap-login100-form-btn\">
                           <div class=\"login100-form-bgbtn\"></div>
                           <button class=\"login100-form-btn\">
                              Login
                           </button>
                        </div>
                     </div>

                     <div class=\"text-center p-t-115\">
                        <span class=\"txt1\">
                           Esqueceu-se da palavra-passe?
                        </span>

                        <a class=\"txt2\" href=\"";
        // line 96
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path("front/lostpassword.php?lostpassword=1"), "html", null, true);
        yield "\">
                           Aqui!
                        </a>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         
         <div id=\"dropDownSelect1\"></div>
";
        return; yield '';
    }

    // line 108
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 109
        yield "   ";
        yield ($context["copyright_message"] ?? null);
        yield "
";
        return; yield '';
    }

    // line 112
    public function block_javascript_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        yield "<script type=\"text/javascript\">
   \$(function () {
\$('#login_name').focus();
});
</script>
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "pages/login.html.twig";
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
        return array (  186 => 112,  178 => 109,  174 => 108,  158 => 96,  140 => 80,  134 => 77,  128 => 76,  125 => 75,  123 => 74,  120 => 73,  114 => 70,  108 => 69,  105 => 68,  103 => 67,  95 => 62,  82 => 52,  71 => 44,  67 => 43,  63 => 42,  59 => 41,  53 => 37,  49 => 36,  38 => 34,);
    }

    public function getSourceContext()
    {
        return new Source("", "pages/login.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\pages\\login.html.twig");
    }
}
