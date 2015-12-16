set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.1296, <2> 39.1421, <3> 15.8749, <4> 20.7564, <5> 23.415, <6> 21.5916, <7> 10.1681, <8> 18.2816, <9> 35.0732, <10> 21.9522, <11> 15.9464, <12> 19.967, <13> 48.8768, <14> 33.8089, <15> 12.6263, <16> 40.7476, <17> 29.3025, <18> 12.3791, <19> 44.6923, <20> 11.2675;
param workload[JOB] := <1> 39.1296, <2> 39.1421, <3> 15.8749, <4> 20.7564, <5> 23.415, <6> 21.5916, <7> 10.1681, <8> 18.2816, <9> 35.0732, <10> 21.9522, <11> 15.9464, <12> 19.967, <13> 48.8768, <14> 33.8089, <15> 12.6263, <16> 40.7476, <17> 29.3025, <18> 12.3791, <19> 44.6923, <20> 11.2675;
param capacity[MACHINE] := <1> 85.8332, <2> 85.8332, <3> 85.8332, <4> 85.8332, <5> 85.8332, <6> 85.8332;

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
