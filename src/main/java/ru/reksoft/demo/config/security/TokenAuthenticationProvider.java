package ru.reksoft.demo.config.security;

import io.jsonwebtoken.JwtException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import ru.reksoft.demo.config.messages.MessageContainer;
import ru.reksoft.demo.service.security.SecurityService;

@Component
public class TokenAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {

    private MessageContainer messages;

    private SecurityService security;

    @Autowired
    public void setMessages(MessageContainer messages) {
        this.messages = messages;
    }

    @Autowired
    public void setSecurity(SecurityService security) {
        this.security = security;
    }


    /**
     * Additional authentication checks.
     *
     * @param user - authenticated user
     * @param auth - authentication token
     * @throws AuthenticationException - if check fails
     */
    @Override
    protected void additionalAuthenticationChecks(UserDetails user, UsernamePasswordAuthenticationToken auth)
            throws AuthenticationException {

    }

    /**
     * Finding user by its authentication token.
     *
     * @param username - authentication username
     * @param auth     - authentication token
     * @return authenticated user
     * @throws AuthenticationException - if authentication fails
     */
    @Override
    protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken auth)
            throws AuthenticationException {

        try {
            return security.authentication(auth.getCredentials().toString());
        } catch (JwtException e) {
            throw new AuthenticationCredentialsNotFoundException(messages.get("reksoft.demo.auth.provider.couldNotParseToken.message"), e);
        }
    }
}
