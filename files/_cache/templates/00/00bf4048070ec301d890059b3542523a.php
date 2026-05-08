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

/* layout/parts/user_header.html.twig */
class __TwigTemplate_55d49b86e979c5bf25f2e93ff7390f3b extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 33
        yield "
";
        // line 34
        $context["rand_header"] = Twig\Extension\CoreExtension::random($this->env->getCharset());
        // line 35
        yield "
<div class=\"btn-group\">
   ";
        // line 37
        if ( !(null === ($context["user"] ?? null))) {
            // line 38
            yield "      <div class=\"navbar-nav flex-row order-md-last user-menu\">
         <div class=\"nav-item dropdown\">
            <a href=\"#\" class=\"nav-link d-flex lh-1 text-reset p-1 dropdown-toggle user-menu-dropdown-toggle ";
            // line 40
            if (($context["is_debug_active"] ?? null)) {
                yield "bg-red-lt";
            }
            yield "\"
               data-bs-toggle=\"dropdown\" data-bs-auto-close=\"outside\">
               ";
            // line 42
            if ( !($context["anonymous"] ?? null)) {
                // line 43
                yield "                  <div class=\"pe-2 d-none d-xl-block\">
                     <div>";
                // line 44
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $this->extensions['Twig\Extra\String\StringExtension']->createUnicodeString($this->extensions['Glpi\Application\View\Extension\DataHelpersExtension']->getVerbatimValue((((CoreExtension::getAttribute($this->env, $this->source, $this->extensions['Glpi\Application\View\Extension\SessionExtension']->session("glpiactiveprofile"), "name", [], "array", true, true, false, 44) &&  !(null === (($__internal_compile_0 = $this->extensions['Glpi\Application\View\Extension\SessionExtension']->session("glpiactiveprofile")) && is_array($__internal_compile_0) || $__internal_compile_0 instanceof ArrayAccess ? ($__internal_compile_0["name"] ?? null) : null)))) ? ((($__internal_compile_1 = $this->extensions['Glpi\Application\View\Extension\SessionExtension']->session("glpiactiveprofile")) && is_array($__internal_compile_1) || $__internal_compile_1 instanceof ArrayAccess ? ($__internal_compile_1["name"] ?? null) : null)) : ("")))), "truncate", [35, "..."], "method", false, false, false, 44), "html", null, true);
                yield "</div>
                     ";
                // line 45
                $context["entity_completename"] = $this->extensions['Glpi\Application\View\Extension\DataHelpersExtension']->getVerbatimValue($this->extensions['Glpi\Application\View\Extension\SessionExtension']->session("glpiactive_entity_name"));
                // line 46
                yield "                     <div class=\"mt-1 small text-muted\" title=\"";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["entity_completename"] ?? null), "html", null, true);
                yield "\"
                          data-bs-toggle=\"tooltip\" data-bs-placement=\"bottom\">
                        ";
                // line 48
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\DataHelpersExtension']->truncateLeft(($context["entity_completename"] ?? null)), "html", null, true);
                yield "
                     </div>
                  </div>

                  ";
                // line 52
                yield Twig\Extension\CoreExtension::include($this->env, $context, "components/user/picture.html.twig", ["users_id" => (($__internal_compile_2 = CoreExtension::getAttribute($this->env, $this->source,                 // line 53
($context["user"] ?? null), "fields", [], "any", false, false, false, 53)) && is_array($__internal_compile_2) || $__internal_compile_2 instanceof ArrayAccess ? ($__internal_compile_2["id"] ?? null) : null), "with_link" => false, "avatar_size" => ""]);
                // line 56
                yield "
               ";
            }
            // line 58
            yield "            </a>
            <div class=\"dropdown-menu dropdown-menu-end mt-1 dropdown-menu-arrow animate__animated animate__fadeInRight\">
               <h6 class=\"dropdown-header\">";
            // line 60
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\ItemtypeExtension']->getItemName(($context["user"] ?? null)), "html", null, true);
            yield "</h6>

               ";
            // line 62
            if ( !($context["anonymous"] ?? null)) {
                // line 63
                yield "                  ";
                yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/profile_selector.html.twig");
                yield "

                  <div class=\"dropdown-divider\"></div>

                  ";
                // line 67
                if ($this->extensions['Glpi\Application\View\Extension\SessionExtension']->hasItemtypeRight("Config", Twig\Extension\CoreExtension::constant("UPDATE"))) {
                    // line 68
                    yield "                     <a href=\"";
                    yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path("/ajax/switchdebug.php"), "html", null, true);
                    yield "\"
                        class=\"dropdown-item ";
                    // line 69
                    if (($context["is_debug_active"] ?? null)) {
                        yield "bg-red-lt";
                    }
                    yield "\"
                        title=\"";
                    // line 70
                    yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Change mode"), "html", null, true);
                    yield "\">
                        <i class=\"ti fa-fw ti-bug debug\"></i>
                        ";
                    // line 72
                    yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(((($context["is_debug_active"] ?? null)) ? (__("Debug mode enabled")) : (__("Debug mode disabled"))), "html", null, true);
                    yield "
                     </a>
                  ";
                }
                // line 75
                yield "               ";
            }
            // line 76
            yield "
               ";
            // line 78
            yield "
               <div class=\"dropdown-item\">
                  <i class=\"ti fa-fw ti-language\"></i>
                  ";
            // line 81
            yield $this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("User::showSwitchLangForm");
            yield "
               </div>

               <div class=\"dropdown-divider\"></div>

               <a href=\"";
            // line 86
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["help_url"] ?? null), "html", null, true);
            yield "\" class=\"dropdown-item\" title=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Help"), "html", null, true);
            yield "\">
                  <i class=\"ti fa-fw ti-help\"></i>
                  ";
            // line 88
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Help"), "html", null, true);
            yield "
               </a>

               <a href=\"#\" class=\"dropdown-item\" title=\"";
            // line 91
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("About"), "html", null, true);
            yield "\"
                  id=\"show_about_modal_";
            // line 92
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["rand_header"] ?? null), "html", null, true);
            yield "\">
                  <i class=\"ti fa-fw ti-info-circle\"></i>
                  ";
            // line 94
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("About"), "html", null, true);
            yield "
                  ";
            // line 95
            if ( !(null === ($context["founded_new_version"] ?? null))) {
                // line 96
                yield "                     <span class=\"badge bg-info text-dark ms-2\">
                        1
                     </span>
                  ";
            }
            // line 100
            yield "               </a>

               <div class=\"dropdown-divider\"></div>

               <a href=\"";
            // line 104
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path("/front/preference.php"), "html", null, true);
            yield "\" class=\"dropdown-item\" title=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("My settings"), "html", null, true);
            yield "\">
                  <i class=\"ti fa-fw ti-adjustments-alt\"></i>
                  ";
            // line 106
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("My settings"), "html", null, true);
            yield "
               </a>
               <a href=\"";
            // line 108
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path(("/front/logout.php" . (((($this->extensions['Glpi\Application\View\Extension\SessionExtension']->session("glpiextauth")) ?: (false))) ? ("?noAUTO=1") : ("")))), "html", null, true);
            yield "\" class=\"dropdown-item\" title=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Logout"), "html", null, true);
            yield "\">
                  <i class=\"ti fa-fw ti-logout\"></i>
                  ";
            // line 110
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Logout"), "html", null, true);
            yield "
               </a>
            </div>
         </div>
      </div>

      <div class=\"modal fade\" id=\"about_modal_";
            // line 116
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["rand_header"] ?? null), "html", null, true);
            yield "\" role=\"dialog\">
         <div class=\"modal-dialog\">
            <div class=\"modal-content\">
               <div class=\"modal-header\">
                  <h4 class=\"modal-title\">";
            // line 120
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("About"), "html", null, true);
            yield "</h4>
                  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"";
            // line 121
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Close"), "html", null, true);
            yield "\"></button>
               </div>
               <div class=\"modal-body\">
                  <p><a href=\"http://glpi-project.org/\" title=\"Powered by Teclib and contributors\" class=\"copyright\">
                     GLPI ";
            // line 125
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(Twig\Extension\CoreExtension::constant("GLPI_VERSION"), "html", null, true);
            yield "
                     Copyright (C) 2015-";
            // line 126
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(Twig\Extension\CoreExtension::constant("GLPI_YEAR"), "html", null, true);
            yield " Teclib' and contributors
                  </a></p>
                  ";
            // line 128
            if ( !(null === ($context["founded_new_version"] ?? null))) {
                // line 129
                yield "                     <p>
                        <a href=\"http://www.glpi-project.org\" target=\"_blank\"
                           title=\"";
                // line 131
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("You will find it on the GLPI-PROJECT.org site."), "html", null, true);
                yield "\">
                           ";
                // line 132
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(Twig\Extension\CoreExtension::sprintf(__("A new version is available: %s."), ($context["founded_new_version"] ?? null)), "html", null, true);
                yield "
                           <span class=\"badge bg-info text-dark\">
                              1
                           </span>
                        </a>
                     </p>
                  ";
            }
            // line 139
            yield "               </div>
            </div>
         </div>
      </div>

   ";
        } elseif (Twig\Extension\CoreExtension::constant("GLPI_DEMO_MODE")) {
            // line 145
            yield "      <div class=\"dropdown-item\">
         <i class=\"fas fa-fw fa-language\"></i>
         ";
            // line 147
            yield $this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("User::showSwitchLangForm");
            yield "
      </div>

   ";
        }
        // line 151
        yield "</div>

<script type=\"text/javascript\">
\$(function() {
   \$(\"#show_about_modal_";
        // line 155
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["rand_header"] ?? null), "html", null, true);
        yield "\").click(function(e) {
      e.preventDefault();
      \$(\"#about_modal_";
        // line 157
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["rand_header"] ?? null), "html", null, true);
        yield "\").remove().modal(\"show\");
   });
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
        return "layout/parts/user_header.html.twig";
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
        return array (  298 => 157,  293 => 155,  287 => 151,  280 => 147,  276 => 145,  268 => 139,  258 => 132,  254 => 131,  250 => 129,  248 => 128,  243 => 126,  239 => 125,  232 => 121,  228 => 120,  221 => 116,  212 => 110,  205 => 108,  200 => 106,  193 => 104,  187 => 100,  181 => 96,  179 => 95,  175 => 94,  170 => 92,  166 => 91,  160 => 88,  153 => 86,  145 => 81,  140 => 78,  137 => 76,  134 => 75,  128 => 72,  123 => 70,  117 => 69,  112 => 68,  110 => 67,  102 => 63,  100 => 62,  95 => 60,  91 => 58,  87 => 56,  85 => 53,  84 => 52,  77 => 48,  71 => 46,  69 => 45,  65 => 44,  62 => 43,  60 => 42,  53 => 40,  49 => 38,  47 => 37,  43 => 35,  41 => 34,  38 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("{#
 # ---------------------------------------------------------------------
 #
 # GLPI - Gestionnaire Libre de Parc Informatique
 #
 # http://glpi-project.org
 #
 # @copyright 2015-2025 Teclib' and contributors.
 # @copyright 2003-2014 by the INDEPNET Development Team.
 # @licence   https://www.gnu.org/licenses/gpl-3.0.html
 #
 # ---------------------------------------------------------------------
 #
 # LICENSE
 #
 # This file is part of GLPI.
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # ---------------------------------------------------------------------
 #}

{% set rand_header = random() %}

<div class=\"btn-group\">
   {% if user is not null %}
      <div class=\"navbar-nav flex-row order-md-last user-menu\">
         <div class=\"nav-item dropdown\">
            <a href=\"#\" class=\"nav-link d-flex lh-1 text-reset p-1 dropdown-toggle user-menu-dropdown-toggle {% if is_debug_active %}bg-red-lt{% endif %}\"
               data-bs-toggle=\"dropdown\" data-bs-auto-close=\"outside\">
               {% if not anonymous %}
                  <div class=\"pe-2 d-none d-xl-block\">
                     <div>{{ (session('glpiactiveprofile')['name'] ?? '')|verbatim_value|u.truncate(35, '...') }}</div>
                     {% set entity_completename = session('glpiactive_entity_name')|verbatim_value %}
                     <div class=\"mt-1 small text-muted\" title=\"{{ entity_completename }}\"
                          data-bs-toggle=\"tooltip\" data-bs-placement=\"bottom\">
                        {{ entity_completename|truncate_left }}
                     </div>
                  </div>

                  {{ include('components/user/picture.html.twig', {
                     'users_id': user.fields['id'],
                     'with_link': false,
                     'avatar_size': '',
                  }) }}
               {% endif %}
            </a>
            <div class=\"dropdown-menu dropdown-menu-end mt-1 dropdown-menu-arrow animate__animated animate__fadeInRight\">
               <h6 class=\"dropdown-header\">{{ get_item_name(user) }}</h6>

               {% if not anonymous %}
                  {{ include('layout/parts/profile_selector.html.twig') }}

                  <div class=\"dropdown-divider\"></div>

                  {% if has_itemtype_right('Config', constant('UPDATE')) %}
                     <a href=\"{{ path('/ajax/switchdebug.php') }}\"
                        class=\"dropdown-item {% if is_debug_active %}bg-red-lt{% endif %}\"
                        title=\"{{ __('Change mode') }}\">
                        <i class=\"ti fa-fw ti-bug debug\"></i>
                        {{ is_debug_active ? __('Debug mode enabled') : __('Debug mode disabled') }}
                     </a>
                  {% endif %}
               {% endif %}

               {# @TODO Saved searches panel #}

               <div class=\"dropdown-item\">
                  <i class=\"ti fa-fw ti-language\"></i>
                  {{ call('User::showSwitchLangForm')|raw }}
               </div>

               <div class=\"dropdown-divider\"></div>

               <a href=\"{{ help_url }}\" class=\"dropdown-item\" title=\"{{ __('Help') }}\">
                  <i class=\"ti fa-fw ti-help\"></i>
                  {{ __('Help') }}
               </a>

               <a href=\"#\" class=\"dropdown-item\" title=\"{{ __('About') }}\"
                  id=\"show_about_modal_{{ rand_header }}\">
                  <i class=\"ti fa-fw ti-info-circle\"></i>
                  {{ __('About') }}
                  {% if founded_new_version is not null %}
                     <span class=\"badge bg-info text-dark ms-2\">
                        1
                     </span>
                  {% endif %}
               </a>

               <div class=\"dropdown-divider\"></div>

               <a href=\"{{ path('/front/preference.php') }}\" class=\"dropdown-item\" title=\"{{ __('My settings') }}\">
                  <i class=\"ti fa-fw ti-adjustments-alt\"></i>
                  {{ __('My settings') }}
               </a>
               <a href=\"{{ path('/front/logout.php' ~ ((session('glpiextauth') ?: false) ? '?noAUTO=1' : '')) }}\" class=\"dropdown-item\" title=\"{{ __('Logout') }}\">
                  <i class=\"ti fa-fw ti-logout\"></i>
                  {{ __('Logout') }}
               </a>
            </div>
         </div>
      </div>

      <div class=\"modal fade\" id=\"about_modal_{{ rand_header }}\" role=\"dialog\">
         <div class=\"modal-dialog\">
            <div class=\"modal-content\">
               <div class=\"modal-header\">
                  <h4 class=\"modal-title\">{{ __('About') }}</h4>
                  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"{{ __('Close') }}\"></button>
               </div>
               <div class=\"modal-body\">
                  <p><a href=\"http://glpi-project.org/\" title=\"Powered by Teclib and contributors\" class=\"copyright\">
                     GLPI {{ constant('GLPI_VERSION') }}
                     Copyright (C) 2015-{{ constant('GLPI_YEAR') }} Teclib' and contributors
                  </a></p>
                  {% if founded_new_version is not null %}
                     <p>
                        <a href=\"http://www.glpi-project.org\" target=\"_blank\"
                           title=\"{{ __('You will find it on the GLPI-PROJECT.org site.') }}\">
                           {{ __('A new version is available: %s.')|format(founded_new_version) }}
                           <span class=\"badge bg-info text-dark\">
                              1
                           </span>
                        </a>
                     </p>
                  {% endif %}
               </div>
            </div>
         </div>
      </div>

   {% elseif constant('GLPI_DEMO_MODE') %}
      <div class=\"dropdown-item\">
         <i class=\"fas fa-fw fa-language\"></i>
         {{ call('User::showSwitchLangForm')|raw }}
      </div>

   {% endif %}
</div>

<script type=\"text/javascript\">
\$(function() {
   \$(\"#show_about_modal_{{ rand_header }}\").click(function(e) {
      e.preventDefault();
      \$(\"#about_modal_{{ rand_header }}\").remove().modal(\"show\");
   });
});
</script>
", "layout/parts/user_header.html.twig", "/home/u981745852/domains/suporteincv.com/public_html/templates/layout/parts/user_header.html.twig");
    }
}
