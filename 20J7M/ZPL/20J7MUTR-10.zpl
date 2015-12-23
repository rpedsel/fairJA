set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.2177, <2> 29.2986, <3> 31.7903, <4> 6.873, <5> 1.0434, <6> 20.6377, <7> 41.6858, <8> 29.7989, <9> 48.7347, <10> 40.6974, <11> 25.4422, <12> 23.0954, <13> 19.222, <14> 10.36, <15> 41.8172, <16> 39.7736, <17> 10.4041, <18> 33.9125, <19> 20.6414, <20> 35.2759;
param workload[JOB] := <1> 29.6106, <2> 41.98, <3> 45.428, <4> 30.6439, <5> 45.1816, <6> 7.6479, <7> 6.8939, <8> 41.0236, <9> 34.3713, <10> 35.7508, <11> 43.2918, <12> 40.0674, <13> 2.2069, <14> 45.379, <15> 18.9203, <16> 40.5521, <17> 12.2351, <18> 9.6199, <19> 46.8132, <20> 9.9583;
param capacity[MACHINE] := <1> 62.9546, <2> 62.9546, <3> 62.9546, <4> 62.9546, <5> 62.9546, <6> 62.9546, <7> 62.9546;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
