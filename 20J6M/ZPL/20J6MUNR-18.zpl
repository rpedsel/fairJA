set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.6868, <2> 33.5446, <3> 12.2142, <4> 22.9604, <5> 34.6911, <6> 28.9678, <7> 16.2925, <8> 36.3153, <9> 38.1904, <10> 12.853, <11> 43.5193, <12> 30.3436, <13> 33.6748, <14> 4.0022, <15> 47.7452, <16> 44.75, <17> 25.23, <18> 47.9402, <19> 32.0086, <20> 46.2173;
param workload[JOB] := <1> 12.4908, <2> 48.7745, <3> 23.3388, <4> 48.9785, <5> 49.6748, <6> 23.2691, <7> 11.4219, <8> 37.8856, <9> 32.7532, <10> 38.3279, <11> 28.7919, <12> 9.7179, <13> 33.4884, <14> 3.0985, <15> 42.4976, <16> 27.0378, <17> 23.3214, <18> 29.512, <19> 36.7467, <20> 12.5322;
param capacity[MACHINE] := <1> 573.6595, <2> 573.6595, <3> 573.6595, <4> 573.6595, <5> 573.6595, <6> 573.6595;

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
