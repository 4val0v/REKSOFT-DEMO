package ru.reksoft.demo.config.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.RequestMatcher;
import ru.reksoft.demo.config.MessagesConfig;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TokenAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

    /**
     * Messages container.
     */
    private final MessagesConfig messages;

    @Value("${jwt.token-type}")
    private String TOKEN_TYPE;

    /**
     * Required authentication request matcher setting.
     */
    protected TokenAuthenticationFilter(RequestMatcher requestMatcher, MessagesConfig messages) {
        super(requestMatcher);
        this.messages = messages;
    }


    /**
     * Returns user authentication in case of successful authentication.
     *
     * @param request  - http request
     * @param response - http response
     * @return authentication
     * @throws AuthenticationException - if valid token not found in request
     */
    @Override
    public Authentication attemptAuthentication(
            HttpServletRequest request,
            HttpServletResponse response

    ) throws AuthenticationException {

        final String token;
        final String credentials = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (credentials == null) {
            throw new AuthenticationCredentialsNotFoundException(messages.get("reksoft.demo.auth.filter.credentialsNotFound.message"));
        } else if (!credentials.startsWith(TOKEN_TYPE)) {
            throw new BadCredentialsException(messages.get("reksoft.demo.auth.filter.credentialsNotValid.message"));
        } else {
            token = credentials.substring(TOKEN_TYPE.length()).trim();
        }

        return getAuthenticationManager().authenticate(new UsernamePasswordAuthenticationToken(null, token));
    }

    /**
     * Actions configuration in case of successful authentication.
     */
    @Override
    protected void successfulAuthentication(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain chain, Authentication authResult

    ) throws IOException, ServletException {

        super.successfulAuthentication(request, response, chain, authResult);
        chain.doFilter(request, response);
    }
}