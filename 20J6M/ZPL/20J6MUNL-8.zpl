set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.7672, <2> 40.5375, <3> 11.3208, <4> 18.1119, <5> 22.1915, <6> 49.16, <7> 6.6139, <8> 25.0767, <9> 5.7194, <10> 9.6549, <11> 25.8016, <12> 36.3992, <13> 35.9819, <14> 31.7306, <15> 35.8387, <16> 24.6073, <17> 19.7735, <18> 2.7395, <19> 19.1874, <20> 34.1364;
param workload[JOB] := <1> 17.7672, <2> 40.5375, <3> 11.3208, <4> 18.1119, <5> 22.1915, <6> 49.16, <7> 6.6139, <8> 25.0767, <9> 5.7194, <10> 9.6549, <11> 25.8016, <12> 36.3992, <13> 35.9819, <14> 31.7306, <15> 35.8387, <16> 24.6073, <17> 19.7735, <18> 2.7395, <19> 19.1874, <20> 34.1364;
param capacity[MACHINE] := <1> 472.3499, <2> 472.3499, <3> 472.3499, <4> 472.3499, <5> 472.3499, <6> 472.3499;

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
