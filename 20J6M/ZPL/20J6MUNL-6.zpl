set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.1143, <2> 20.1087, <3> 4.7626, <4> 46.6177, <5> 12.5344, <6> 5.2897, <7> 9.8533, <8> 32.3841, <9> 37.4196, <10> 4.6214, <11> 49.1439, <12> 12.2757, <13> 26.5673, <14> 11.6563, <15> 3.8725, <16> 25.471, <17> 46.4713, <18> 46.8378, <19> 45.7187, <20> 18.99;
param workload[JOB] := <1> 30.1143, <2> 20.1087, <3> 4.7626, <4> 46.6177, <5> 12.5344, <6> 5.2897, <7> 9.8533, <8> 32.3841, <9> 37.4196, <10> 4.6214, <11> 49.1439, <12> 12.2757, <13> 26.5673, <14> 11.6563, <15> 3.8725, <16> 25.471, <17> 46.4713, <18> 46.8378, <19> 45.7187, <20> 18.99;
param capacity[MACHINE] := <1> 490.7103, <2> 490.7103, <3> 490.7103, <4> 490.7103, <5> 490.7103, <6> 490.7103;

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
