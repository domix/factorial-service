package com.domingosuarez.talks.kubernetes.jvmmx.factorialservice.web;

import org.apache.commons.math3.util.CombinatoricsUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/factorial")
public class FactorialController {

  @GetMapping("/")
  public String index() {
    return "OK";
  }

  @GetMapping("/{of}")
  public FactorialResult calculate(@PathVariable("of") Integer of) {

    long factorial = CombinatoricsUtils.factorial(of);

    return FactorialResult.builder()
      .of(of)
      .result(factorial)
      .version("0.0.4")
      .build();
  }
}
