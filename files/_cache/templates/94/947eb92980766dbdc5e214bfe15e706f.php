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

/* password_form.html.twig */
class __TwigTemplate_0a4c4fb39ebd24794a35667901dd66e9 extends Template
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
        ];
    }

    protected function doGetParent(array $context)
    {
        // line 34
        return "layout/page_card_notlogged.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        $this->parent = $this->loadTemplate("layout/page_card_notlogged.html.twig", "password_form.html.twig", 34);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
    }

    // line 36
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 37
        yield "   ";
        if ((array_key_exists("token_ok", $context) && (($context["token_ok"] ?? null) == false))) {
            // line 38
            yield "      ";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Your password reset request has expired or is invalid. Please renew it."), "html", null, true);
            yield "
   ";
        } elseif (        // line 39
array_key_exists("messages_only", $context)) {
            // line 40
            yield "      ";
            yield Twig\Extension\CoreExtension::include($this->env, $context, "components/messages_after_redirect_alerts.html.twig");
            yield "
   ";
        } else {
            // line 42
            yield "      <form action=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path("front/lostpassword.php"), "html", null, true);
            yield "\" method=\"post\" autocomplete=\"off\" data-submit-once>
         <input type=\"hidden\" name=\"_glpi_csrf_token\" value=\"";
            // line 43
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(Session::getNewCSRFToken(), "html", null, true);
            yield "\" />
         <h2 class=\"card-title text-center mb-4\">";
            // line 44
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Forgotten password?"), "html", null, true);
            yield "</h2>

         ";
            // line 46
            if (array_key_exists("token", $context)) {
                // line 47
                yield "            <input type=\"hidden\" name=\"password_forget_token\" value=\"";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["token"] ?? null), "html", null, true);
                yield "\" />
            <p class=\"text-muted mb-4\">
               ";
                // line 49
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Please enter your new password."), "html", null, true);
                yield "
            </p>
            <div class=\"mb-3\">
               <label class=\"form-label\">";
                // line 52
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Password"), "html", null, true);
                yield "</label>
               <input type=\"password\" name=\"password\" autocomplete=\"new-password\"
                      class=\"form-control\" placeholder=\"";
                // line 54
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Password"), "html", null, true);
                yield "\"
                      id=\"password\" onkeyup=\"return passwordCheck();\" />
            </div>
            <div class=\"mb-3\">
               <label class=\"form-label\">";
                // line 58
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Password confirmation"), "html", null, true);
                yield "</label>
               <input type=\"password\" name=\"password2\" autocomplete=\"new-password2\"
                        class=\"form-control\" placeholder=\"";
                // line 60
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Password"), "html", null, true);
                yield "\" />
            </div>

            ";
                // line 63
                if ($this->extensions['Glpi\Application\View\Extension\ConfigExtension']->config("use_password_security")) {
                    // line 64
                    yield "               <div class=\"alert alert-warning\">
                  <h3>";
                    // line 65
                    yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Password security policy"), "html", null, true);
                    yield "</h3>
                  ";
                    // line 66
                    $this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("Config::displayPasswordSecurityChecks");
                    // line 67
                    yield "               </div>
            ";
                }
                // line 69
                yield "
            ";
                // line 70
                $context["save_button"] = (("<i class=\"far fa-save\"></i><span>" . __("Save new password")) . "<span>");
                // line 71
                yield "
         ";
            } else {
                // line 73
                yield "            <p class=\"text-muted mb-4\">
               ";
                // line 74
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Please enter your email address. An email will be sent to you and you will be able to choose a new password."), "html", null, true);
                yield "
            </p>
            <div class=\"mb-3\">
               <label class=\"form-label\">";
                // line 77
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(_n("Email", "Emails", 1), "html", null, true);
                yield "</label>
               <input type=\"email\" name=\"email\" class=\"form-control\" placeholder=\"";
                // line 78
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(_n("Email", "Emails", 1), "html", null, true);
                yield "\" />
            </div>
            ";
                // line 80
                $context["save_button"] = (("<i class=\"fas fa-envelope\"></i><span>" . __("Send")) . "<span>");
                // line 81
                yield "         ";
            }
            // line 82
            yield "
         <div class=\"form-footer\">
            <button class=\"btn btn-icon btn-primary w-100\" name=\"update\">
               ";
            // line 85
            yield ($context["save_button"] ?? null);
            yield "
            </button>
         </div>
      </form>
   ";
        }
        return; yield '';
    }

    // line 92
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 93
        yield "   ";
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Forget it,"), "html", null, true);
        yield "
   <a href=\"";
        // line 94
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->indexPath(), "html", null, true);
        yield "\">";
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("send me back"), "html", null, true);
        yield "</a>
   ";
        // line 95
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("to the login screen."), "html", null, true);
        yield "
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "password_form.html.twig";
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
        return array (  197 => 95,  191 => 94,  186 => 93,  182 => 92,  171 => 85,  166 => 82,  163 => 81,  161 => 80,  156 => 78,  152 => 77,  146 => 74,  143 => 73,  139 => 71,  137 => 70,  134 => 69,  130 => 67,  128 => 66,  124 => 65,  121 => 64,  119 => 63,  113 => 60,  108 => 58,  101 => 54,  96 => 52,  90 => 49,  84 => 47,  82 => 46,  77 => 44,  73 => 43,  68 => 42,  62 => 40,  60 => 39,  55 => 38,  52 => 37,  48 => 36,  37 => 34,);
    }

    public function getSourceContext()
    {
        return new Source("", "password_form.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\password_form.html.twig");
    }
}
