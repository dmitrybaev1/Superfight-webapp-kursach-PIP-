package configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import pip.coursework.superfight.UserRepository;
import service.CustomUserDetailsService;
@EnableGlobalMethodSecurity
@EnableWebSecurity
@ComponentScan("service")
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private CustomUserDetailsService customUserDetailsService;
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{
        auth.userDetailsService(customUserDetailsService).passwordEncoder(getPasswordEncoder());
    }

    private PasswordEncoder getPasswordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence charSequence) {
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
                return true;
            }
        };
    }

    @Override
    protected  void configure(HttpSecurity http) throws Exception{
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/main","/choose","/fight","/result").authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin().loginPage("/login").permitAll()
                .and().formLogin().loginProcessingUrl("/loginForm")
                .and().formLogin().failureUrl("/error_login").permitAll()
                .and().logout().logoutSuccessUrl("/login");

    }
}
