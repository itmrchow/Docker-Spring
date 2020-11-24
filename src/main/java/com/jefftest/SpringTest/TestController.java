package com.jefftest.SpringTest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api")
public class TestController {

    @GetMapping(value = "/v1/{name}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getTestStr(@PathVariable String name) {
        return "Hello " + name;
    }
}
