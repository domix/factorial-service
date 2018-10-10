package factorial.service;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.QueryValue;

import static org.apache.commons.math3.util.CombinatoricsUtils.factorial;

@Controller("/factorial")
public class FactorialController {

  @Get
  public String index() {
    return "OK";
  }

  @Get("/{of}")
  public FactorialResult calculate(@QueryValue("of") Integer of) {
    return FactorialResult.builder()
      .of(of)
      .result(factorial(of))
      .version("0.0.5")
      .build();
  }
}
