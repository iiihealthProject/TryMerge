package tw.iiihealth.membersystem.member.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.iiihealth.membersystem.member.service.MemberDetailsService;


@Configuration
@Order(2)
public class MemberSecurityConfig extends WebSecurityConfigurerAdapter {

	@Qualifier("memberDetailsService")
	@Autowired
	private MemberDetailsService memberDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(memberDetailsService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http
		.antMatcher("/Member/**")
		.authorizeRequests().anyRequest().authenticated()
		.and().formLogin().loginPage("/Member/login")
			.defaultSuccessUrl("/Member/login/success", true)
			.failureUrl("/Member/login/AccessDenied")
		.permitAll()
		.and().logout().logoutUrl("/Member/logout").logoutSuccessUrl("/HealthProject");
	
		http.csrf().disable();
		
		
//		http
//		.authorizeRequests()
//		.antMatchers(HttpMethod.GET, "/Member/**").authenticated()
//		.antMatchers(HttpMethod.GET).permitAll()
//		.antMatchers(HttpMethod.POST, "/Member/**").authenticated()
//		.antMatchers(HttpMethod.POST).permitAll()
//		.anyRequest().authenticated()
//		.and()
//		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
//		.and()
//		.csrf().disable()
//		.formLogin().loginPage("/Member/login").defaultSuccessUrl("/Member/login/success",true).failureUrl("/Member/login/AccessDenied").permitAll()
//        .and()
//        .logout().logoutUrl("/Member/logout").logoutSuccessUrl("/Member/login");
	
	}
}
