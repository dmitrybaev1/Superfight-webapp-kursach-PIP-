package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.mem.InMemoryUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.social.security.SpringSocialConfigurer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

//@EnableGlobalMethodSecurity
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService customUserDetailsService;
    @Autowired
    private FacebookConnectionSignup facebookConnectionSignup;
    /*@Bean
    public ConnectionFactoryLocator connectionFactoryLocator(){
        ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
        registry.addConnectionFactory(new FacebookConnectionFactory(
                "2088465628101600","7734b488d50c5986b41dcf396425f47f"
        ));
        return registry;
    }
    @Bean
    public InMemoryUsersConnectionRepository usersConnectionRepository(){
        return new InMemoryUsersConnectionRepository(connectionFactoryLocator());
    }*/
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
                .and().formLogin().loginProcessingUrl("/loginForm").defaultSuccessUrl("/main")
                .and().formLogin().failureUrl("/error_login").permitAll()
                .and().logout().logoutSuccessUrl("/login")
                .and().apply(new SpringSocialConfigurer())
                .postLoginUrl("/mainfb").alwaysUsePostLoginUrl(true);

    }

    @Bean
    public SocialUserDetailsService socialUserDetailsService(){
        return new SimpleSocialUsersDetailsService(userDetailsService());
    }

   /* @Bean
    public ProviderSignInController providerSignInController() {
        (usersConnectionRepository())
                .setConnectionSignUp(facebookConnectionSignup);

        return new ProviderSignInController(
                connectionFactoryLocator(),
                usersConnectionRepository(),
                new FacebookSignInAdapter());
    }*/
}
