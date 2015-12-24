set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.6356, <2> 34.889, <3> 15.8457, <4> 44.8647, <5> 37.0036, <6> 28.3502, <7> 25.8058, <8> 43.4033, <9> 37.0404, <10> 3.9079, <11> 39.009, <12> 35.4961, <13> 27.797, <14> 45.37, <15> 5.9546, <16> 11.768, <17> 31.3342, <18> 46.1467, <19> 5.9125, <20> 1.6886;
param workload[JOB] := <1> 45.6356, <2> 34.889, <3> 15.8457, <4> 44.8647, <5> 37.0036, <6> 28.3502, <7> 25.8058, <8> 43.4033, <9> 37.0404, <10> 3.9079, <11> 39.009, <12> 35.4961, <13> 27.797, <14> 45.37, <15> 5.9546, <16> 11.768, <17> 31.3342, <18> 46.1467, <19> 5.9125, <20> 1.6886;
param capacity[MACHINE] := <1> 60.7739, <2> 60.7739, <3> 60.7739, <4> 60.7739, <5> 60.7739, <6> 60.7739, <7> 60.7739;

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
