set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8651, <2> 24.3817, <3> 23.9642, <4> 26.3968, <5> 16.8276, <6> 24.0614, <7> 28.2104, <8> 24.668, <9> 22.7178, <10> 30.541, <11> 26.9283, <12> 26.8796, <13> 23.3818, <14> 24.5325, <15> 26.9569, <16> 18.0634, <17> 26.0115, <18> 24.993, <19> 24.8895, <20> 24.8355;
param workload[JOB] := <1> 952.6544, <2> 594.4673, <3> 574.2829, <4> 696.7911, <5> 283.1681, <6> 578.951, <7> 795.8267, <8> 608.5102, <9> 516.0984, <10> 932.7527, <11> 725.1333, <12> 722.5129, <13> 546.7086, <14> 601.8436, <15> 726.6745, <16> 326.2864, <17> 676.5981, <18> 624.65, <19> 619.4872, <20> 616.8021;
param capacity[MACHINE] := <1> 12720.1995, <2> 12720.1995, <3> 12720.1995, <4> 12720.1995, <5> 12720.1995, <6> 12720.1995, <7> 12720.1995;

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
