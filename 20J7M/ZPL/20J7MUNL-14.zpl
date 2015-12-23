set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.7283, <2> 16.0518, <3> 33.0226, <4> 46.1029, <5> 3.5309, <6> 11.8491, <7> 14.8299, <8> 44.7112, <9> 10.4232, <10> 29.4782, <11> 2.8394, <12> 0.7178, <13> 44.9377, <14> 16.9423, <15> 35.2398, <16> 14.6255, <17> 0.5274, <18> 0.3092, <19> 45.3928, <20> 24.019;
param workload[JOB] := <1> 32.7283, <2> 16.0518, <3> 33.0226, <4> 46.1029, <5> 3.5309, <6> 11.8491, <7> 14.8299, <8> 44.7112, <9> 10.4232, <10> 29.4782, <11> 2.8394, <12> 0.7178, <13> 44.9377, <14> 16.9423, <15> 35.2398, <16> 14.6255, <17> 0.5274, <18> 0.3092, <19> 45.3928, <20> 24.019;
param capacity[MACHINE] := <1> 428.279, <2> 428.279, <3> 428.279, <4> 428.279, <5> 428.279, <6> 428.279, <7> 428.279;

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
