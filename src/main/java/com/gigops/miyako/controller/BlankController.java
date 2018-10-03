package com.gigops.miyako.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/blank")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class BlankController {

  @GetMapping("ping")
  @ResponseBody
  public String ping() {
    
    return "pong!";
  }
  
}
