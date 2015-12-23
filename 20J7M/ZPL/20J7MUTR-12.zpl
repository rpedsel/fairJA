set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.394, <2> 48.5633, <3> 2.8347, <4> 45.7843, <5> 10.4587, <6> 34.4293, <7> 22.3385, <8> 46.4796, <9> 17.0729, <10> 18.3002, <11> 19.9366, <12> 7.2636, <13> 47.2601, <14> 38.3015, <15> 21.8612, <16> 10.9934, <17> 12.9404, <18> 13.0806, <19> 8.1302, <20> 46.674;
param workload[JOB] := <1> 19.7032, <2> 4.3801, <3> 3.7512, <4> 32.9354, <5> 10.3613, <6> 2.1558, <7> 12.1696, <8> 44.9367, <9> 46.8335, <10> 4.8423, <11> 28.0238, <12> 37.4121, <13> 33.3649, <14> 13.2192, <15> 3.9367, <16> 14.7516, <17> 37.9479, <18> 5.6097, <19> 40.2102, <20> 36.1117;
param capacity[MACHINE] := <1> 46.3561, <2> 46.3561, <3> 46.3561, <4> 46.3561, <5> 46.3561, <6> 46.3561, <7> 46.3561;

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
