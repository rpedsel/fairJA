set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.8583, <2> 13.992, <3> 43.0491, <4> 49.0307, <5> 13.3638, <6> 7.7329, <7> 27.8846, <8> 43.4125, <9> 17.2965, <10> 25.4288, <11> 31.9603, <12> 3.4385, <13> 19.955, <14> 24.1863, <15> 44.0725, <16> 45.651, <17> 32.7155, <18> 46.8141, <19> 13.0616, <20> 28.0961;
param workload[JOB] := <1> 9.8583, <2> 13.992, <3> 43.0491, <4> 49.0307, <5> 13.3638, <6> 7.7329, <7> 27.8846, <8> 43.4125, <9> 17.2965, <10> 25.4288, <11> 31.9603, <12> 3.4385, <13> 19.955, <14> 24.1863, <15> 44.0725, <16> 45.651, <17> 32.7155, <18> 46.8141, <19> 13.0616, <20> 28.0961;
param capacity[MACHINE] := <1> 67.625, <2> 67.625, <3> 67.625, <4> 67.625, <5> 67.625, <6> 67.625;

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
